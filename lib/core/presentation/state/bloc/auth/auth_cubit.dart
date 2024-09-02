import 'package:chat/core/data/data_sources/local/shared_pref.dart';
import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoImp) : super(AuthStateLoading()){
    isAuthenticated();
  }

  final AuthRepoImp authRepoImp;

  void isAuthenticated() async {
    String? token = await getTokenFromLocalStorage();

    if (token == null) {
      print('11111111111111111111111');
      emit(UnAuthenticated());
    } else {
      bool isConnected = await InternetConnectionChecker().hasConnection;

      if (isConnected) {
        
        bool checked = await authRepoImp.checkToken(token);
        
        
        if (checked) {
          print('22222222222222222222222222222222');
          emit(Authenticated());
        } else {
          
          print('333333333333333333333333333333');
          emit(UnAuthenticated());
        }
      } else {
        print('44444444444444444444444');
        emit(Authenticated());
      }
    }
  }
}
