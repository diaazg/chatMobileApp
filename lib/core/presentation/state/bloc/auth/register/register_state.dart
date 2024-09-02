import 'package:chat/core/data/models/user_model.dart';

abstract class RegisterState {}

class RegisterStateInit extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateSuccess extends RegisterState {
  UserModel user;
  RegisterStateSuccess({required this.user});
}

class RegisterStateFailure extends RegisterState {
  String error;
  RegisterStateFailure({required this.error});
}

