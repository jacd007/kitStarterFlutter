import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';

class AuthService extends GetxController {
  var authed = "xxx".obs; //TODO: text empty required

  var loading = false.obs;

  TextEditingController ctrUser = TextEditingController();
  TextEditingController ctrPassword = TextEditingController();

  /// Method to authenticate and route to the home page or to the login page
  Future<void> isAuthed() async {
    await Future.delayed(const Duration(milliseconds: 200));
    /* final bool login = authed.value.isEmpty;
    Get.offAllNamed(login ? Routes.login : Routes.homeMain); */
    Get.offAllNamed(Routes.homeMain);
  }
}
