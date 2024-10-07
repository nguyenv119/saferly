import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? fileToBase64(String? filePath) {
  //File file = File(filePath);
  //List<int> fileBytes = file.readAsBytesSync();
  //String base64String = base64Encode(fileBytes);
  //return base64String;
}

int jsonNumberToInt(dynamic input) {
  // Check if the input is null
  if (input == null) {
    return 0; // Or any default value you prefer
  }

  // If it's already an integer, return it
  if (input is int) {
    return input;
  }

  // If it's a double, convert it to an integer
  if (input is double) {
    return input.round();
  }

  // If it's a string, try to parse it
  if (input is String) {
    return int.tryParse(input) ?? 0; // Return 0 if parsing fails
  }

  // If it's none of the above, return a default value
  return 0;
}

LatLng createLatLng(
  double latitude,
  double longitude,
) {
  return LatLng(latitude, longitude);
}
