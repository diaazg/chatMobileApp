import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/auth/register/register_state.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterStateInit());

  final _authRepoImp = getIt<AuthRepoImp>();

  void register(String email, String username,
      String password, String phoneNbr, String profileTitle) async {
    emit(RegisterStateLoading());
    var result = await _authRepoImp.register(email,username,password,phoneNbr,profileTitle);

    result.fold((failure) {
      
      emit(RegisterStateFailure(error: failure.errorMessage));
    }, (success) {
      emit(RegisterStateSuccess(user: success));
    });
  }
}
