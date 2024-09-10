import 'package:chat/core/data/data_sources/local/shared_pref.dart';
import 'package:chat/core/data/models/token_model.dart';
import 'package:dartz/dartz.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/domain/repo_abs/auth_repo_abs.dart';
import 'package:chat/core/data/data_sources/remote/auth.dart';
import 'package:chat/utils/error/error_handler.dart';

class AuthRepoImp extends AuthRepoAbs {
  final AuthRemote authRemote;

  AuthRepoImp({required this.authRemote});

  @override
  void logOut() {
    // TODO: implement logOut
  }

  @override
  Future<Either<Failure, UserModel>> login(
      String username, String password) async {
    try {
      UserModel userData = await authRemote.login(username, password);
     
      await saveTokenToLocalStorage(userData);

      return right(userData);
    } catch (e) {
      if (e is Serverfailure) {
        return left(e);
      } else {
        return left(Serverfailure("Login failed: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      String email, String username, String password,
      String phoneNbr, String profileTitle) async {
    try {
      UserModel userData = await authRemote.register(email, username, password,phoneNbr,profileTitle);
      
      await saveTokenToLocalStorage(userData);
      return right(userData);
    } catch (e) {
      if (e is Serverfailure) {
        return left(e);
      } else {
        return left(Serverfailure("Register failed: ${e.toString()}"));
      }
    }
  }

  @override
  Future<bool> checkToken(TokenModel token) async {
    try {
      await authRemote.checkToken(token);
      return true;
    } 
    catch (e) {
      
      return false;
    }
  }
}
