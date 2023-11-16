// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
//import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //---- HEADERs
  // ignore: non_constant_identifier_names
  static final HEADERS_SIMPLE = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // ignore: non_constant_identifier_names
  static final HEADERS_FORM_DATA = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  // ignore: non_constant_identifier_names
  static Map<String, String> HEADERS_AUTH(String token) {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": token,
    };
  }

  static String basicAuth(
      {required String username, required String password}) {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    return basicAuth;
  }

  //----- Query's
  static String queryFromJson(Map<String, dynamic> json) {
    String query = '';
    var keys = json.keys;
    var values = json.values;
    for (int i = 0; i < keys.length; i++) {
      if (i == 0) query += '?${keys.first}=${values.first}';
      if (i != 0) query += '&${keys.elementAt(i)}=${values.elementAt(i)}';
    }
    return query;
  }

  //---- URL
  static Uri getUrl({required url, required endpoint, dynamic params}) =>
      params != null
          ? Uri.https(url, endpoint, params)
          : Uri.https(url, endpoint);
  //--------
  static getBody(http.Response response) {
    String b = utf8.decode(response.bodyBytes);
    final json = jsonDecode(b);
    return json;
  }

  static Future<Uint8List> getResponse(String path) async {
    final url = Uri.parse(path);
    final response = await http.get(url);
    return response.bodyBytes;
  }

  static Future<bool> checkConnection(
      [Uri? url, Map<String, String>? header]) async {
    /// uri google
    final Uri uriGoogle = Uri.parse('https://google.com');
    int statusCode = 404;

    try {
      var response = await http.get(
        url ?? uriGoogle,
        headers: header ?? HEADERS_SIMPLE,
      );

      debugPrint('Check Connection status: ${response.statusCode} ');

      return statusCode != 404;
    } catch (_) {
      return false;
    }
  }

  /* Stream<Object?> get getDevicePositionsStream async* {
    final streamController = StreamController<Object?>.broadcast();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      streamController.sink.add(value);
    });

    yield* streamController.stream;
  } */

  // GET

  // ignore: non_constant_identifier_names
  static Future<http.Response?> GET({
    required Uri url,
    bool printResp = false,
    bool printUrl = true,
    Map<String, String>? header,
    int timeout = 80,
  }) async {
    final sq = url.query.isEmpty ? "" : "?${url.query}";
    try {
      var response = await http
          .get(
            url,
            headers: header ?? HEADERS_SIMPLE,
          )
          .timeout(Duration(seconds: timeout));
      if (printUrl) {
        debugPrint(
            'Response GET status: ${response.statusCode} || ${url.path}/$sq');
      }
      if (printResp) debugPrint('Response body: ${response.body}');
      return response;
    } catch (_) {
      return null;
    }
  }

  // POST

  // ignore: non_constant_identifier_names
  static Future<http.Response?> POST({
    required Uri url,
    required body,
    bool printResp = false,
    Map<String, String>? header,
    int timeOut = 80,
    bool isFormData = false,
  }) async {
    try {
      var response = await http
          .post(
            url,
            body: isFormData ? body : jsonEncode(body),
            headers: header ?? HEADERS_SIMPLE,
          )
          .timeout(Duration(seconds: timeOut));
      debugPrint(
          'Response POST status: ${response.statusCode}  || ${url.path}');
      if (printResp) debugPrint('Response body: ${response.body}');
      return response;
    } catch (_) {
      return null;
    }
  }

  // PUT

  // ignore: non_constant_identifier_names
  static Future<http.Response?> PUT({
    required Uri url,
    required body,
    bool printResp = false,
    Map<String, String>? header,
    int timeOut = 80,
    bool isFormData = false,
  }) async {
    try {
      var response = await http
          .put(
            url,
            body: isFormData ? body : jsonEncode(body),
            headers: header ?? HEADERS_SIMPLE,
          )
          .timeout(Duration(seconds: timeOut));
      debugPrint('Response PUT status: ${response.statusCode}  || ${url.path}');
      if (printResp) debugPrint('Response body: ${response.body}');
      return response;
    } catch (_) {
      return null;
    }
  }

// DELETE

  // ignore: non_constant_identifier_names
  static Future<http.Response?> DELETE({
    required Uri url,
    bool printResp = false,
    Map<String, String>? header,
    int timeout = 300,
  }) async {
    try {
      var response = await http
          .delete(
            url,
            headers: header ?? HEADERS_SIMPLE,
          )
          .timeout(Duration(seconds: timeout));
      debugPrint(
          'Response DELETE status: ${response.statusCode} || ${url.path}');
      if (printResp) debugPrint('Response body: ${response.body}');
      return response;
    } catch (_) {
      return null;
    }
  }

// notification push services
  static Future<void> sendMessageFirebaseCloud(
      {required String tokenSend,
      required String authorization,
      String title = '',
      String content = '',
      Map<String, dynamic>? data,
      bool printResp = false,
      int timeOut = 300}) async {
    // header
    Map<String, String> headersAuth = {
      "Authorization": authorization,
      "Content-Type": 'application/json',
    };

    // body send
    Map<String, dynamic> body = {
      "to": tokenSend,
      "notification": {"title": title, "body": content},
      "data": data ?? {}
    };

    try {
      var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      var response = await http
          .post(
            url,
            body: jsonEncode(body),
            headers: headersAuth,
          )
          .timeout(Duration(seconds: timeOut));
      debugPrint('Response status: ${response.statusCode}');
      if (printResp) debugPrint('Response body: ${response.body}');
    } catch (_) {}
  }
} //....

// ===========================

class ApiResponse {
  final int code;
  final http.Response response;
  final dynamic respObject;

  ApiResponse({
    required this.code,
    required this.response,
    this.respObject,
  });

  ApiResponse copyWith({
    int? code,
    http.Response? response,
    dynamic respObject,
  }) =>
      ApiResponse(
        code: code ?? this.code,
        response: response ?? this.response,
        respObject: respObject ?? this.respObject,
      );
}
