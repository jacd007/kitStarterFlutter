// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../undefined_m.dart';

class RepositoriesUndefined {
  Future<List<Undefined>> fromRemote({int page = 1, int length = 20}) async {
    List<Undefined> list = [];
    final data = await ProviderUndefined.getUndefinedRemoteData(
        page: page, length: length);

    try {
      for (var json in data) {
        final model = Undefined.fromJson(json);
        list.add(model);
      }
    } catch (_) {}
    // debugPrint('REPOSITORY Remote PAGE $page || ${list.length} items');
    return list;
  }

  Future<List<Undefined>> fromLocal({int page = 1, int length = 20}) async {
    List<Undefined> list = [];

    final data = await ProviderUndefined.getUndefinedLocalData(
        page: page, length: length);

    try {
      for (var json in data) {
        final model = Undefined.fromJson(json);
        list.add(model);
      }
    } catch (_) {}

    // debugPrint('REPOSITORY Local PAGE $page || ${list.length} items');

    return list;
  }
}
