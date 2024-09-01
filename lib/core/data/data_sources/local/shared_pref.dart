import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveTokenToLocalStorage(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}

Future<Map<String, dynamic>> getTokenFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? mapAsString = prefs.getString('auth_token');
  Map<String, dynamic> retrievedMap = {
    for (var item
        in mapAsString!.replaceAll('{', '').replaceAll('}', '').split(','))
      item.split(':')[0].trim(): item.split(':')[1].trim()
  };

  return retrievedMap;
}



Future<void> clearTokenFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');
}

Future<bool> checkLocalAuthStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('auth_token');
}