import 'package:chat/core/data/models/user_model.dart';

abstract class LoginState {}


class LoginStateInit extends LoginState {}

class LoginStateSuccess extends LoginState {
  UserModel user;
  LoginStateSuccess({required this.user});
}

class LoginStateFailure extends LoginState {
  String error;

  LoginStateFailure({required this.error});
}

class LoginStateLoading extends LoginState {}

