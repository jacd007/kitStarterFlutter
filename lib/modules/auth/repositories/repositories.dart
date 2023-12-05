import 'package:flutter/material.dart';

import '../auth_m.dart';

class AuthRepositories extends AuthProvider {
  ///
  /// To Login in [AuthRepositories]
  Future<AuthResponse?> postLogin({
    required String user,
    required String password,
  }) async {
    final resp = await AuthProvider.postLogin(user, password);
    try {
      final model = AuthResponse.fromJson(resp);

      return model;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
