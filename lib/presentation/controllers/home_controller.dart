// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';

import '../../modules/modules.dart';
import '../presentation.dart';

class HomeController extends GetxController implements UndefinedUseCase {
  /// Entity undefined
  final undefinedEntities = UndefinedEntities();

  ScrollController scrollCtr1 = ScrollController();
  final showButtonToStartScroll = false.obs;
  final hasMoreToLoad1 = true.obs;

  final _page1 = 1.obs;

  var listUndefined = <Undefined>[].obs;
  var list1 = <dynamic>[].obs;

  // ====================================================================

  @override
  void onInit() {
    getUndefined(isLocal: true);
    super.onInit();

    // Listener models
    scrollCtr1.addListener(_handleScroll1);
  }

  // ====================================================================
  // ============================ USES_CASES ============================

  @override
  Future<List<Undefined>> getUndefined({page, length, isLocal}) async {
    List<Undefined> data = await undefinedEntities.getUndefined(
      page: page,
      length: length,
      isLocal: isLocal,
    );

    if (page == null) {
      listUndefined.value = data;
    } else {
      listUndefined.addAll(data);
      if (data.isNotEmpty) {
        _page1.value++;
        // debugPrint('Reload page: $page in Function!!!');
      }
    }

    update();
    return data;
  }

  // ====================================================================
  // ========================== UPDATE Scrolls ==========================

  void _handleScroll1() async {
    final pixel = scrollCtr1.position.pixels;
    final maxScroll = scrollCtr1.position.maxScrollExtent * 0.8;

    final bool hasMaxScroll = pixel >= maxScroll;
    final int page = _page1.value;
    final bool isContinue = hasMoreToLoad1.value;

    showButtonToStartScroll.value = pixel != 0.0;
    update();

    //
    if (hasMaxScroll && isContinue) {
      hasMoreToLoad1.value = false;

      await getUndefined(page: page);
      hasMoreToLoad1.value = true;
      update();
    }
  }

  void toStartScroll({double? offset}) async {
    await scrollCtr1.animateTo(
      offset ?? 0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    showButtonToStartScroll.value = false;
    update();
  }

  // ====================================================================
  // ========================= xxxxxxxxxxxxxxxx =========================

  // ====================================================================
  // ======================= XXXXXXXX =======================
}
