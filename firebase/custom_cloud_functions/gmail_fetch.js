const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.gmailFetch = functions
  .region("us-central1")
  .runWith({
    memory: "256MB",
  })
  .https.onCall((data, context) => {
    if (!context.auth.uid) {
      return;
    }
    const accessToken = data.accessToken;
    // Write your code below!

    // Write your code above!
    return [{}];
  });
