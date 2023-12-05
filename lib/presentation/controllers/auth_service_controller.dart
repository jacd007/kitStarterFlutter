import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';
import '../../modules/auth/auth_m.dart';

class AuthService extends GetxController implements AuthUseCase {
  final _authEntities = AuthEntities();
  var authed = "".obs;

  var loading = false.obs;

  TextEditingController ctrUser = TextEditingController();
  TextEditingController ctrPassword = TextEditingController();

  ///
  late SharedPreferences _preferences;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() async {
    _preferences = await Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());

    final pref = _preferences.getString(Constants.shared_JWT) ?? '';

    authed.value = pref;
    update();
  }

  /// Method to authenticate and route to the home page or to the login page
  Future<void> isAuthed() async {
    await _init();
    final bool login = authed.value.isEmpty;
    Get.offAllNamed(login ? Routes.login : Routes.homeMain);
    // Get.offAllNamed(Routes.homeMain);
  }

  // =========
  Future<void> loginWithUserAndPassword() async {
    loading.value = true;
    final isLogin = await _fakeLogin();
    loading.value = false;

    debugPrint('LOGIN: $isLogin');
    if (isLogin) Get.offAndToNamed(Routes.homeMain);
  }

  Future<bool> _fakeLogin() async {
    final user = ctrUser.text.trim();
    final pass = ctrPassword.text.trim();
    final model = AuthModel(user: user, password: pass);
    final resp = await toLogin(authModel: model);

    final String pref = resp?.jwt ?? '';
    final bool isLogin = resp?.login ?? false;

    if (isLogin) {
      await _preferences.setString(Constants.shared_JWT, pref);
      authed.value = pref;
    }
    return isLogin;
  }

  @override
  Future<AuthResponse?> toLogin({required AuthModel authModel}) async {
    final resp = await _authEntities.toLogin(authModel: authModel);
    return resp;
  }
}
