// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;

Future<String> getCurrentDomain() async {
  if (kIsWeb) {
    final location = html.window.location;
    final domain = '${location.protocol}//${location.hostname}';
    final fullUrl = location.href;

    print('Domain: $domain');
    print('Full URL: $fullUrl');

    return domain;
  } else {
    print('This function is only available on web platforms.');
    return '';
  }
}
