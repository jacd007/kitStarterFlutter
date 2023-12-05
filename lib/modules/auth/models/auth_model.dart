class AuthModel {
  final String user;
  final String password;

  AuthModel({
    required this.user,
    required this.password,
  });

  AuthModel copyWith({
    String? user,
    String? password,
  }) =>
      AuthModel(
        user: user ?? this.user,
        password: password ?? this.password,
      );

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        user: json["user"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "password": password,
      };
}
