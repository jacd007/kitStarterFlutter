// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'db_mySQL_helper.dart';

class DB {
  /// db version
  static const int version = 1;

  Future<Database> testing(TableName table) async {
    final path = join(await getDatabasesPath(), 'testingDB.db');

    return openDatabase(path, onCreate: (db, version) async {
      // test
      await db.execute('SELECT * FROM ${table.name}');
    }, version: version);
  }

  Future<Database> _openDB() async {
    final path = join(await getDatabasesPath(), 'customDB.db');

    return openDatabase(
      path,
      onCreate: (db, version) async {
        // Model1
        await db.execute(DbHelper.sqlCreateModel1);
      },
      version: version,
      onUpgrade: (db, oldVersion, newVersion) async {
        /* // sellers
        if (oldVersion <= 2) {
          await db.execute(helper.sqlVCard2);
          await Future.delayed(const Duration(microseconds: 10));
        } */
      },
    );
  }

  /// get data's length from Table [table]
  Future<int> getLength(String table, [bool debug = false]) async {
    Database database = await _openDB();
    final count = Sqflite.firstIntValue(
            await database.rawQuery('SELECT COUNT(*) FROM $table')) ??
        0;
    // final List<Map<String, dynamic>> list = await database.query(table);
    //database.close();
    if (debug) debugPrint('$table: $count');

    return count;
  }

  /// get data from Table [table]
  Future<List<Map<String, dynamic>>> get(String table,
      [bool debug = false]) async {
    Database database = await _openDB();

    List<Map<String, dynamic>> list = [];
    list = await database.query(table);

    //database.close();
    if (debug) debugPrint('$table: ${list.length}');

    return list;
  }

  /// insert  data to Table [table]
  Future<int> insert(
      {required String table, required Map<String, dynamic> values}) async {
    Database database = await _openDB();

    try {
      final id = await database.insert(
        table,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      //database.close();
      return id;
    } catch (e) {
      return await database.insert(
        table,
        values,
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
  }

  /// update data from Table [table]
  Future<int> update({
    required String table,
    required Map<String, dynamic> values,
    String where = "id = ?",
    required List<String?> whereArgs,
  }) async {
    Database database = await _openDB();
    debugPrint('${where.replaceAll("?", "")}$whereArgs is updated...');

    return await database.update(table, values,
        where: where, whereArgs: whereArgs);
  }

  /// delete data from Table [table]
  Future<int> delete({
    required String table,
    String where = 'id = ?',
    Object? id,
  }) async {
    Database database = await _openDB();
    debugPrint('${where == 'id = ?' ? "id = $id" : where} init delete...');
    final ids = await database.delete(table, where: where, whereArgs: [id]);
    debugPrint('${where.replaceAll("?", "")}$ids is Deleted...');
    return ids;
    //database.close();
  }

  /// delete data from Table [table]
  Future<int> deleteAll({
    required String table,
  }) async {
    Database database = await _openDB();
    debugPrint(' init delete all...');
    final ids = await database.delete(table);
    debugPrint('$ids is Deleted...');
    return ids;
    //database.close();
  }

  /// update data from Table [table]
  Future<int> update2({
    required String table,
    required Map<String, dynamic> values,
  }) async {
    Database database = await _openDB();
    debugPrint('fun update2 is updated...');

    return await database.update(table, values);
  }
}
