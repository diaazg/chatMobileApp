import 'package:chat/core/data/models/token_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/utils/error/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepoAbs {
  Future<bool> checkToken(TokenModel token);
  Future<Either<Failure, UserModel>> login(String username, String password);
  Future<Either<Failure, UserModel>> register(String email, String username,
      String password, String phoneNbr, String profileTitle);
  void logOut();
}
