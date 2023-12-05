import 'dart:convert';

class AuthResponse {
  final String user;
  final String password;
  final bool login;
  final String jwt;

  AuthResponse({
    required this.user,
    required this.password,
    required this.login,
    required this.jwt,
  });

  AuthResponse copyWith({
    String? user,
    String? password,
    bool? login,
    String? jwt,
  }) =>
      AuthResponse(
        user: user ?? this.user,
        password: password ?? this.password,
        login: login ?? this.login,
        jwt: jwt ?? this.jwt,
      );

  factory AuthResponse.fromRawJson(String str) =>
      AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: json["user"],
        password: json["password"],
        login: json["login"],
        jwt: json["JWT"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "password": password,
        "login": login,
        "JWT": jwt,
      };
}
