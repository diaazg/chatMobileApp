class UserModel {
  final String? username;
  final String email;
  final String? password;
  final String? token ;

  UserModel({this.token,this.username, required this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
  );

  Map<String, dynamic> toJsonLogin() => {
        'email': email,
        'password': password,
  };
    Map<String, dynamic> toJsonRegister() => {
        'username': username,
        'email': email,
        'password': password,
  };
}