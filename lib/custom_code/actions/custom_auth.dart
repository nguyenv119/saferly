// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<List<dynamic>?> customAuth() async {
  try {
    // For web, use FirebaseAuth signInWithPopup
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('email');
    googleProvider.addScope('https://www.googleapis.com/auth/gmail.readonly');

    // Sign in with popup
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Get access token from the credential
    OAuthCredential? credential = userCredential.credential as OAuthCredential?;
    String? accessToken = credential?.accessToken;

    User? user = userCredential.user;

    if (user == null || accessToken == null) {
      print('No user information or access token available');
      return null;
    }

    // Construct a list with access token and user information
    List<dynamic> result = [
      accessToken, // [0]: Access Token
      {
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
      }, // [1]: User Information
    ];

    return result;
  } catch (e) {
    print('Error during Google Sign-In: $e');
    return null;
  }
}
