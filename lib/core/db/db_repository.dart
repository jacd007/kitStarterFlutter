import 'package:get/get.dart';
import 'package:sembast/sembast.dart';

import 'db_controller.dart';

///
class DBRepository extends ItemsRepository {
  final Database _database = Get.find<DbController>().database;
  StoreRef? store;

  DBRepository({this.store}) {
    const name = 'storeDB';
    store ??= intMapStoreFactory.store(name);
  }

  @override
  Future<int> insert(Map<String, dynamic> json) async {
    final id = await store?.add(_database, json);
    return id ?? json['id'] ?? -1;
  }

  @override
  Future<Object?> update(Object? id, Map<String, dynamic> json) async {
    return await store?.record(id).update(_database, json);
  }

  @override
  Future<Object?> delete(int jsonId) async {
    return await store!.record(jsonId).delete(_database);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllJson() async {
    final snap = await store!.find(_database);
    List<Map<String, dynamic>> list = snap.map(
      (snapshot) {
        var map = snapshot.value as Map<String, dynamic>;
        var id = snapshot.key as int;

        Map<String, dynamic> json = {};
        json.addAll(map);
        json["id"] = id;
        return json;
      },
    ).toList(growable: false);

    return list;
  }
}

///
abstract class ItemsRepository {
  Future<int> insert(Map<String, dynamic> json);

  Future<Object?> update(Object? id, Map<String, dynamic> json);

  Future<Object?> delete(int jsonId);

  Future<List<Map<String, dynamic>>> getAllJson();
}
