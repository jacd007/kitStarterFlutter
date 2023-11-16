import 'package:flutter/material.dart';

///
///
class ProviderUndefined {
  ///
  ///
  static Future<List<Map<String, dynamic>>> getUndefinedRemoteData(
      {int page = 1, int length = 20}) async {
    List<Map<String, dynamic>> list = [];

    await Future.delayed(const Duration(seconds: 1));
    if (page > 5) return [];

    for (var i = 0; i < length; i++) {
      list.add(
        {
          "id": i + (page - 1) * length,
          "data": "Data ${1 + i + (page - 1) * length} \nPage $page\nRemote",
          "status": i % 2 == 0,
          "prices": i * 3.14,
        },
      );
    }

    debugPrint('PROVIDER Undefined from Remote');

    return list;
  }

  ///
  ///
  static Future<List<Map<String, dynamic>>> getUndefinedLocalData(
      {int page = 1, int length = 20}) async {
    List<Map<String, dynamic>> list = [];

    await Future.delayed(const Duration(milliseconds: 500));

    for (var i = 0; i < length; i++) {
      list.add(
        {
          "id": i + (page - 1) * length,
          "data": "Data ${1 + i + (page - 1) * length} \nPage $page\nLocal",
          "status": i % 2 == 0,
          "prices": i * 3.14,
        },
      );
    }

    debugPrint('PROVIDER Undefined from Local');

    return list;
  }
}
