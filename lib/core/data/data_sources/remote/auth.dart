import 'package:chat/core/data/models/token_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/utils/api/api_service.dart';

class AuthRemote {
  final ApiService apiService;

  AuthRemote({required this.apiService});

  Future<UserModel> login(String username, String password) async {
    dynamic data =
        UserModel(password: password, username: username).toJsonLogin();

    var response = await apiService.post(endPoint: 'login', data: data);

    UserModel userData = UserModel.fromJson(response);

    return userData;
  }

  Future<UserModel> register(String email, String username, String password,
      String phoneNbr, String profileTitle) async {
    dynamic data = UserModel(
            email: email,
            password: password,
            username: username,
            phoneNbr: phoneNbr,
            profileTitle: profileTitle)
        .toJsonRegister();
    var response = await apiService.post(endPoint: 'register', data: data);
    UserModel userData = UserModel.fromJson(response);

    return userData;
  }

  Future<void> checkToken(TokenModel token) async {
    await apiService.get(endPoint: 'checkToken', token: token.toJson());
  }
}
