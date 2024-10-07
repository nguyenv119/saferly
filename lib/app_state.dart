import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<dynamic> _authResult = [];
  List<dynamic> get authResult => _authResult;
  set authResult(List<dynamic> value) {
    _authResult = value;
  }

  void addToAuthResult(dynamic value) {
    authResult.add(value);
  }

  void removeFromAuthResult(dynamic value) {
    authResult.remove(value);
  }

  void removeAtIndexFromAuthResult(int index) {
    authResult.removeAt(index);
  }

  void updateAuthResultAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    authResult[index] = updateFn(_authResult[index]);
  }

  void insertAtIndexInAuthResult(int index, dynamic value) {
    authResult.insert(index, value);
  }

  List<dynamic> _mailList = [];
  List<dynamic> get mailList => _mailList;
  set mailList(List<dynamic> value) {
    _mailList = value;
  }

  void addToMailList(dynamic value) {
    mailList.add(value);
  }

  void removeFromMailList(dynamic value) {
    mailList.remove(value);
  }

  void removeAtIndexFromMailList(int index) {
    mailList.removeAt(index);
  }

  void updateMailListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    mailList[index] = updateFn(_mailList[index]);
  }

  void insertAtIndexInMailList(int index, dynamic value) {
    mailList.insert(index, value);
  }
}
