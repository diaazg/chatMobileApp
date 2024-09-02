import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/auth/login/login_state.dart';
import 'package:chat/core/presentation/state/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateInit());

  final _authRepoImp = getIt<AuthRepoImp>();

  void login(String username, String password) async {
    print(username);
    emit(LoginStateLoading());
    var result = await _authRepoImp.login(username, password);

    result.fold((failure) {
      emit(LoginStateFailure(error: failure.errorMessage));
    }, (success) {
      emit(LoginStateSuccess(user: success));
    });
  }
}
