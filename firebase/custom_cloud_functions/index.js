const admin = require("firebase-admin/app");
admin.initializeApp();

const gmailFetch = require("./gmail_fetch.js");
exports.gmailFetch = gmailFetch.gmailFetch;
const gmailFetch2 = require("./gmail_fetch2.js");
exports.gmailFetch2 = gmailFetch2.gmailFetch2;
