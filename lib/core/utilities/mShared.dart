// ignore_for_file: file_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
// get Map item to shared
  static Future<Map<String, dynamic>?> getMap(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final str = prefs.getString(key) ?? '';
      final map = jsonDecode(str);
      return map;
    } on Exception catch (_) {
      return null;
    }
  }

  // get Map item to shared
  static Future<bool> setMap(String key, Object? mapValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final map = jsonEncode(mapValue);
      return prefs.setString(key, map);
    } on Exception catch (_) {
      return false;
    }
  }

  // delete item to shared
  static Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // clean all data to shared
  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // getters

  static Future<String> getString(String key, [String strDefault = ""]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? strDefault;
  }

  static Future<int> getInt(String key, [int strDefault = -1]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? strDefault;
  }

  static Future<bool> getBool(String key, [bool strDefault = false]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? strDefault;
  }

  static Future<double?> getDouble(String key, [double? strDefault]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? strDefault;
  }

  static Future<List<String>> getListString(List<String> keys) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = [];
    for (var key in keys) {
      final value = prefs.getString(key) ?? "";
      if (value.isNotEmpty) {
        list.add(value);
      }
    }
    return list;
  }

  // setters

  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> setInt(String key, var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static Future<void> setBool(String key, var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<void> setDouble(String key, var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  static Future<void> setListString(Map<String, String> map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var i = 0; i < map.length; i++) {
      await prefs.setString(map.keys.elementAt(i), map.values.elementAt(i));
    }
  }

  // toggle
  static Future<bool> toggleKey(String key, [bool? strDefault]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(key) ?? strDefault ?? false;
    await prefs.setBool(key, !value);
    return !value;
  }
}
