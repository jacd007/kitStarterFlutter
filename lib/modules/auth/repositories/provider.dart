// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AuthProvider extends GetConnect {
  ///
  /// To login
  static Future<Map<String, dynamic>> postLogin(
      String user, String password) async {
    //
    final url = Uri.parse('https://www.google.co.ve');
    final resp = await get(url);
    debugPrint(resp.statusCode.toString());

    final userB = user == 'user';
    final passB = password == 'Test1234!';
    final bool isLogin = userB && passB;
    await Future.delayed(const Duration(seconds: 1));
    final pref = await Future.value(isLogin ? 'login_is_OK' : '');

    final map = {
      "user": user,
      "password": "*" * password.length,
      "login": isLogin,
      "JWT": pref,
    };
    debugPrint(map.toString());

    return map;
  }
}
