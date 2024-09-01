import 'package:chat/core/data/data_sources/remote/auth.dart';
import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/core/presentation/state/classes/camera.dart';
import 'package:chat/utils/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<Camera>(Camera());
  Dio dio = Dio();
  ApiService apiService = ApiService(dio);
  AuthRemote authRemote = AuthRemote(apiService: apiService);
  AuthRepoImp authRepoImp = AuthRepoImp(authRemote: authRemote);
  getIt.registerSingleton<AuthRepoImp>(authRepoImp);

}