import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveTokenToLocalStorage(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}

Future<String?> getTokenFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token');
}





Future<void> clearTokenFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');
}

Future<bool> checkLocalAuthStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('auth_token');
}