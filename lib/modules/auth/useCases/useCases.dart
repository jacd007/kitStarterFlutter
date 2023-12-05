// ignore_for_file: file_names

import '../auth_m.dart';

abstract class AuthUseCase {
  // functions
  Future<AuthResponse?> toLogin({required AuthModel authModel});
}
