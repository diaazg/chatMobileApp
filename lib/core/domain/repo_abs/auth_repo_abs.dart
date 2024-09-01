import 'package:chat/utils/error/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepoAbs {

  Future<Either<Failure,String>>login(String username,String password);
  Future<Either<Failure,String>>register(String username,String email,String password);
  void logOut();
  

}