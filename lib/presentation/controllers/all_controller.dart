import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../presentation/presentation.dart';
import '../../core/core.dart';

class AllController extends GetxController {
  /// [selectedIndex] index position from screen
  var selectedIndex = 0.obs;

  /// [listViewIndex] list memory from index position screens
  var listViewIndex = <int>[0].obs;

  /// Desktop
  var showTextMenuDesktop = true.obs;

  /// [devices] device identify `mac`.
  String devices = "";

  var contactSupportPhone = "".obs;
  var contactSupportEmail = "".obs;

  // local dateTime
  late Timer timer;
  String _timeString = '';
  String get timeString => _timeString;

  @override
  void onInit() {
    debugPrint('statement');
    _timeString = _formatDateTime(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.onInit();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  /// [onItemTapped] change the index in the controller to change screen in the
  /// widgets list "screen".
  void onItemTapped(int index) {
    listViewIndex.add(index);

    // final old = selectedIndex.value;
    // debugPrint('old: $old | new: $index');

    selectedIndex.value = index;

    update();
  }

  ///
  Future<bool> onWillPop(_) async {
    if (listViewIndex.length <= 1) return onWillPopExit();

    listViewIndex.removeLast();
    selectedIndex.value = listViewIndex.last;

    return Future.value(false);
  }

  DateTime? currentBackPressTime;
  Future<bool> onWillPopExit() async {
    final customColors = CustomColors(Get.context!);
    DateTime now = DateTime.now();

    final val1 = currentBackPressTime == null;
    final val2 = now.difference(currentBackPressTime ?? now);
    const def = Duration(milliseconds: 1300);

    if (val1 || val2 > def) {
      currentBackPressTime = now;
      customColors.light = grey;
      if (CheckPlatform.isModeMobile) {
        await Utils.toast(
          Tk.toastMsgExit.tr,
          toastLength: 1,
        );
      } else {
        Get.snackbar(
          Tk.toastTitleExit.tr,
          Tk.toastMsgExit.tr,
          duration: def,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: customColors.colorThemeMode,
        );
      }

      return Future.value(false);
    }
    return Future.value(true);
  }

  /// lista de widgets de pantallas
  final List<Widget> screen = [
    const HomeScreen(), // 0
    const Home2Screen(), // 1
    const SizedBox(), // 2
    const SizedBox(), // 3
    const SettingsScreen(), // 4
    // ..............
    const SizedBox(), // 5
    const SizedBox(), // 6
    const SizedBox(), // 7
    const SizedBox(), // 8
  ];

  final icons = [
    Constants.menu1,
    Constants.menu2,
    Constants.menu3,
    Constants.menu4,
    Constants.LOGO_ICON2,
    //
    'menuTest',
    'menuTest',
    'menuTest',
    'menuTest',
  ];

  final titles = [
    Tk.tMenu1.tr,
    Tk.tMenu2.tr,
    Tk.tMenu3.tr,
    Tk.tMenu4.tr,
    Tk.tMenu5.tr,
    //
    'menuTest',
    'menuTest',
    'menuTest',
    'menuTest',
  ];

  /// replace screen un homeMain
  Widget get screenChange {
    return screen.elementAt(selectedIndex.value);
  }

  //==================== DATE TIME LOCAL ====================
  void _getTime({String formate = 'hh:mm:ss a'}) {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatDateTime(now, formate);

    _timeString = formattedTime;
    update();
  }

  String _formatDateTime(DateTime dateTime, [String formate = 'hh:mm:ss a']) {
    return DateFormat(formate).format(dateTime);
  }
  // =======================================================
}
