import 'package:chat/core/data/models/token_model.dart';

class UserModel {
  final String? username;
  final String? email;
  final String? password;
  TokenModel? token;
  final String? phoneNbr;
  final String? profileTitle;
  final int? uid;
  final bool? isFriend;

  UserModel({
    this.token,
    this.username,
    this.email,
    this.password,
    this.phoneNbr,
    this.profileTitle,
    this.uid,
    this.isFriend
  });

  set tokenSetter(TokenModel inputToken) {
    token = inputToken;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      username: json['user_info']['username'] ,
      email: json['user_info']['email'],
      uid: json['user_info']['uid'],
      password: json['user_info']['password'],
      phoneNbr: json['user_info']['phone_number'],
      profileTitle: json['user_info']['profile_title'],
      token: TokenModel.fromJson(json['token_obj']));
  
  factory UserModel.getPeoples(Map<String, dynamic> json)=>UserModel(
     username: json['username'],
     uid:json['uid'],
     isFriend: false
  );
  



  Map<String, dynamic> toJsonLogin() => {
        'username': username,
        'password': password,
      };
  Map<String, dynamic> toJsonRegister() => {
        'username': username,
        'email': email,
        'password': password,
        'phone_number': phoneNbr,
        'profile_title': profileTitle
      };
}
