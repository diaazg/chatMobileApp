import 'package:chat/core/data/models/token_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveTokenToLocalStorage(UserModel user) async {
  final prefs = await SharedPreferences.getInstance();
  TokenModel token = user.token!;
  String access = token.accessToken!;
  String refresh = token.refreshToken!;
  await prefs.setString('access_token', access);
  await prefs.setString('refresh_token', refresh);
  await prefs.setInt('uid', user.uid!);
  await prefs.setString('username', user.username!);
  await prefs.setString('email', user.email!);
  await prefs.setString('phone_number', user.phoneNbr!);
  await prefs.setString('ptofile_title', user.profileTitle!);
}

Future<TokenModel?> getTokenFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  String? access = prefs.getString('access_token');
  String? refresh = prefs.getString('refresh_token');
  TokenModel token = TokenModel(accessToken: access, refreshToken: refresh);

  return token;
}

Future<UserModel> getUserInfoFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  int? uid = prefs.getInt('uid');
  String? username = prefs.getString('username');
  String? email = prefs.getString('email');
  String? phoneNbr = prefs.getString('phone_number');
  String? profileTitle = prefs.getString('ptofile_title');
  return UserModel(
      uid: uid,
      username: username,
      email: email,
      profileTitle: profileTitle,
      phoneNbr: phoneNbr);
}

Future<void> clearTokenFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('access_token');
  await prefs.remove('refresh_token');
}

Future<bool> checkLocalAuthStatus() async {
  final prefs = await SharedPreferences.getInstance();
  bool access = prefs.containsKey('access_token');
  bool refresh = prefs.containsKey('refresh_token');
  bool result = access && refresh;
  return result;
}
