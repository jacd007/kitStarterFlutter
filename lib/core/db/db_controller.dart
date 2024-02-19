import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'db_repository.dart';

class DbController extends GetxController {
  final String nameDB = "dbSembast";

  /// instance DB
  late Database database;

  /// is ok instance DB
  var inicialice = false.obs;

  ///
  late DBRepository dbRepository;

  @override
  void onInit() {
    super.onInit();
    // xxx
    _initSembast();
  }

  Future _initSembast() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, '$nameDB.db');
    debugPrint(databasePath);
    final db = await databaseFactoryIo.openDatabase(databasePath);
    database = db;
    dbRepository = DBRepository();
    inicialice.value = true;
    update();
  }

  Future<List<Map<String, dynamic>>> getAllJson() async {
    final list = await dbRepository.getAllJson();
    return list;
  }

  /// DB insert item.
  /// Not necessary id.
  /// return id.
  Future<int> insertJson(Map<String, dynamic> json) async {
    final id = await dbRepository.insert(json);
    return id;
  }

  Future<Object?> updateJson(Object? id, Map<String, dynamic> json) async {
    return await dbRepository.update(id, json);
  }

  Future<Object?> deleteJson(int id) async {
    return await dbRepository.delete(id);
  }

  Future<Map<String, dynamic>?> getMapById(int id,
      [String keyID = 'id']) async {
    try {
      final list = await dbRepository.getAllJson();
      final map = list.firstWhere((item) => item[keyID] == id);
      return map;
    } catch (_) {
      return null;
    }
  }
}
