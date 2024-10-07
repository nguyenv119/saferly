import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBXL1wnm12tJmxEdG6MuwAUP6363R1Z-ss",
            authDomain: "elderly-email-pb6b1z.firebaseapp.com",
            projectId: "elderly-email-pb6b1z",
            storageBucket: "elderly-email-pb6b1z.appspot.com",
            messagingSenderId: "938087355542",
            appId: "1:938087355542:web:949bf64001837675ca5eb7"));
  } else {
    await Firebase.initializeApp();
  }
}
