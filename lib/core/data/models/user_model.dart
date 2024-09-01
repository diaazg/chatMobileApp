class UserModel {
  final String? username;
  final String email;
  final String password;

  UserModel({this.username, required this.email, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
  );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
  };
}