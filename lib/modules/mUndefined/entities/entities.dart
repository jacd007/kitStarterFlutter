// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../undefined_m.dart';

class UndefinedEntities {
  final RepositoriesUndefined _repositories = RepositoriesUndefined();

// ============================== REMOTE ==============================

  ///
  Future<List<Undefined>> getUndefined(
      {int? page, int? length, bool? isLocal}) async {
    // initial
    length ??= 20;
    page ??= 1;
    bool local = isLocal ?? false;

    List<Undefined> list = [];

    if (local) {
      list = await _repositories.fromLocal(page: page, length: length);
    } else {
      list = await _repositories.fromRemote(page: page, length: length);
    }

    // String from = local ? "Local" : "Remote";
    // debugPrint('ENTITY $from PAGE $page || ${list.length} items');
    return list;
  }
}
