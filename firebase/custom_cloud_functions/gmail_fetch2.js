const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { google } = require("googleapis");
const axios = require("axios");

// Initialize Firebase Admin SDK if needed (optional)
// admin.initializeApp(); // Uncomment if you need admin functionalities

// Replace these with your actual Client ID and Client Secret from Google Developer Console
const CLIENT_ID =
  "NOT FOR YOU LOL";
const CLIENT_SECRET = "NOT FOR YOU LOL";
const REDIRECT_URI =
  "NOT FOR YOU LOL";
const IP_QUALITY_SCORE_API_KEY = "NOT FOR YOU LOL";

/**
 * Helper function to create an OAuth2 client.
 * @param {string} accessToken - The access token.
 * @returns {google.auth.OAuth2} - The authenticated OAuth2 client.
 */
function createOAuth2Client(accessToken) {
  const oauth2Client = new google.auth.OAuth2(
    CLIENT_ID,
    CLIENT_SECRET,
    REDIRECT_URI,
  );

  oauth2Client.setCredentials({
    access_token: accessToken,
  });

  return oauth2Client;
}

async function email_validation(email) {
  try {
    const response = await axios.get(
      `https://www.ipqualityscore.com/api/json/email/${IP_QUALITY_SCORE_API_KEY}/${encodeURIComponent(email)}`,
    );
    return response.data;
  } catch (error) {
    console.error("Error checking verifying email:", error);
    return null;
  }
}

async function ip_validation(ipAddress) {
  try {
    const response = await axios.get(
      `https://www.ipqualityscore.com/api/json/ip/${IP_QUALITY_SCORE_API_KEY}/${encodeURIComponent(ipAddress)}`,
    );
    return response.data;
  } catch (error) {
    console.error("Error validating IP address:", error);
    return null;
  }
}

function randomize_scoore(emailQuality, ipQuality) {
  // Calculate the average score
  const averageScore = (emailQuality + ipQuality) / 2;

  // Round to the nearest whole number
  const roundedScore = Math.round(averageScore);

  // Apply a random adjustment between -3 and +3
  const adjustment = Math.floor(Math.random() * 7) - 3;
  const adjustedScore = roundedScore + adjustment;

  // Ensure the score is within the range of 0 to 100
  const finalScore = Math.max(0, Math.min(100, adjustedScore));

  return finalScore;
}

/**
 * Cloud Function to fetch Gmail labels.
 */
exports.gmailFetch2 = functions
  .region("us-central1")
  .runWith({
    memory: "256MB",
  })
  .https.onCall(async (data, context) => {
    let emails = []; // Declare emails variable at the beginning
    const accessToken = data.accessToken;
    try {
      // Authentication check and input validation...
      console.log("Starting gmailFetch function");

      const oauth2Client = createOAuth2Client(accessToken);
      console.log("OAuth2 client created");

      const gmail = google.gmail({ version: "v1", auth: oauth2Client });
      console.log("Gmail client initialized");

      const response = await gmail.users.messages.list({
        userId: "me",
        maxResults: 15,
      });

      const messages = response.data.messages;
      console.log("Number of messages:", messages.length);

      emails = await Promise.all(
        messages.map(async (message) => {
          const email = await gmail.users.messages.get({
            userId: "me",
            id: message.id,
            format: "full", // Request full message details
          });

          // Extract email content
          const headers = email.data.payload.headers;
          const subject =
            headers.find((header) => header.name === "Subject")?.value ||
            "No Subject";
          const from =
            headers.find((header) => header.name === "From")?.value ||
            "Unknown Sender";

          let body = "";
          if (email.data.payload.parts) {
            // Multipart email
            body =
              email.data.payload.parts.find(
                (part) => part.mimeType === "text/plain",
              )?.body?.data || "";
          } else {
            // Single part email
            body = email.data.payload.body?.data || "";
          }

          // Decode the body from base64
          const decodedBody = Buffer.from(body, "base64").toString("utf-8");

          // Extract email address from the 'from' field
          const emailAddress = from.match(/<(.+)>/)?.[1] || from;
          console.log(emailAddress);

          // Check email quality
          const emailValidation = await email_validation(emailAddress);
          const emailQuality = 100 - emailValidation.fraud_score;

          // Check ip quality
          const email_IP_address = emailValidation.a_records[0];
          const ipValidation = await ip_validation(email_IP_address);
          const ipQuality = 100 - ipValidation.fraud_score;

          // Get latitude and longitude
          const latitude = ipValidation.latitude;
          const longitude = ipValidation.longitude;

          // Calculate score
          const final_score = randomize_scoore(emailQuality, ipQuality);

          console.log("Fetched email:", {
            subject: subject,
            from: from,
            bodyPreview: decodedBody.substring(0, 100) + "...",
            emailQuality: final_score,
          });

          return {
            subject: subject,
            from: from,
            body: decodedBody,
            emailQuality: final_score,
            latitude: latitude,
            longitude: longitude,
            emailValidation: emailValidation,
            ipValidation: ipValidation,
          };
        }),
      );

      console.log("All emails fetched. Number of emails:", emails.length);
      console.log("Final Emails", emails);
      return emails;
    } catch (error) {
      console.error("Error fetching Gmail messages:", error);
    }
  });
