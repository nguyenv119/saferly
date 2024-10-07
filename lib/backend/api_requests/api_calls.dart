import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EmailVerificationCall {
  static Future<ApiCallResponse> call({
    String? email = 'inbitesasehackathon@gmail.com',
    String? apiKey = 'oURnTsOGFGAD8WAxFuwVJn75KLGGqvWA',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'emailVerification',
      apiUrl:
          'https://www.ipqualityscore.com/api/json/email/${apiKey}/${email}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'EMAIL': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class URLVeficationCall {
  static Future<ApiCallResponse> call({
    String? apiKey = 'eaPmQI6dwbWeOGkrVN9wuBECXgO09gaa',
    String? url = 'google.com',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'URLVefication',
      apiUrl: 'https://www.ipqualityscore.com/api/json/url',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'url': url,
        'key': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IpAddressVerificationCall {
  static Future<ApiCallResponse> call({
    String? ipAddress = '68.187.217.172',
    String? apiKey = 'oURnTsOGFGAD8WAxFuwVJn75KLGGqvWA',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ipAddressVerification',
      apiUrl: 'https://ipqualityscore.com/api/json/ip/${apiKey}/${ipAddress}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'IP_ADDRESS': ipAddress,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FileVerificationCall {
  static Future<ApiCallResponse> call({
    String? base64EncodedFileContent = '',
  }) async {
    final ffApiRequestBody = '''
{
  "inputFileBytes": "BASE64_ENCODED_FILE_CONTENT"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fileVerification',
      apiUrl: 'https://api.cloudmersive.com/virus/scan/file',
      callType: ApiCallType.POST,
      headers: {
        'Apikey': '169be492-1ff4-4307-ba68-419e9ae9255f',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PasswordGeneratorCall {
  static Future<ApiCallResponse> call({
    int? length = 16,
    bool? lowercase = true,
    bool? uppercase = true,
    bool? special = true,
    bool? numbers = true,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'passwordGenerator',
      apiUrl: 'https://api.genratr.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'length': length,
        'uppercas': uppercase,
        'lowercase': lowercase,
        'special': special,
        'numbers': numbers,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmailRepVerificationCall {
  static Future<ApiCallResponse> call({
    String? email = 'bill@microsoft.com',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'emailRepVerification',
      apiUrl: 'https://emailrep.io/${email}?User-Agent=ElderlyEmail',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GmailSendCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? body = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'gmailSend',
      apiUrl:
          'https://us-central1-elderly-email-pb6b1z.cloudfunctions.net/sendEmail',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'to': to,
        'subject': subject,
        'body': body,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
