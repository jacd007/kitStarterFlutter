import '../auth_m.dart';

class AuthEntities extends AuthRepositories implements AuthUseCase {
  //
  @override
  Future<AuthResponse?> toLogin({required AuthModel authModel}) async {
    final resp = await postLogin(
      user: authModel.user,
      password: authModel.password,
    );

    return resp;
  }
}
