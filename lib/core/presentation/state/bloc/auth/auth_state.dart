import 'package:chat/core/data/models/user_model.dart';

abstract class AuthState {}



class AuthStateLoading extends AuthState {}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  
  final UserModel userModel;

  Authenticated({required this.userModel});


}