import 'package:chat/core/data/data_sources/local/local_auth.dart';
import 'package:chat/core/data/models/token_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoImp) : super(AuthStateLoading()) {
    isAuthenticated();
  }



  final AuthRepoImp authRepoImp;
 

  void isAuthenticated() async {
    emit(AuthStateLoading());
    bool checkLocal = await checkLocalAuthStatus();

    if (checkLocal == false) {
      emit(UnAuthenticated());
    } else {
      TokenModel? token = await getTokenFromLocalStorage();

      if (token == null || token.tokenEmpty()) {
        emit(UnAuthenticated());
      } else {
        bool isConnected = await InternetConnectionChecker().hasConnection;

        if (isConnected) {
          bool checked = await authRepoImp.checkToken(token);

          if (checked) {
            UserModel userModel = await getUserInfoFromLocalStorage();
            emit(Authenticated(
              userModel: userModel
            ));
          } else {
            emit(UnAuthenticated());
          }
        } else {
          UserModel userModel = await getUserInfoFromLocalStorage();
            emit(Authenticated(
              userModel: userModel
            ));
        }
      }
    }
  }

 

}
