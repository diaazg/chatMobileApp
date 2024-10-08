import 'package:chat/core/data/data_sources/remote/auth.dart';
import 'package:chat/core/data/data_sources/remote/friends.dart';
import 'package:chat/core/data/data_sources/remote/messages.dart';
import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/core/data/repo_imp/friends_repo_imp.dart';
import 'package:chat/core/data/repo_imp/messages_repo_imp.dart';
import 'package:chat/utils/classes/camera.dart';
import 'package:chat/utils/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<Camera>(Camera());
  Dio dio = Dio();
  ApiService apiService = ApiService(dio);

  // data sourcess

  AuthRemote authRemote = AuthRemote(apiService: apiService);
  FriendsRemote friendsRemote = FriendsRemote(apiService: apiService);
  MessageRemote messageRemote = MessageRemote(apiService: apiService);

  

  // repo implementation

  AuthRepoImp authRepoImp = AuthRepoImp(authRemote: authRemote);
  FriendsRepoImp friendsRepoImp = FriendsRepoImp(friendsRemote: friendsRemote);
  MessagesRepoImp messagesRepoImp = MessagesRepoImp(messageRemote: messageRemote);



   // singleton 

  getIt.registerSingleton<AuthRepoImp>(authRepoImp);
  getIt.registerSingleton<FriendsRepoImp>(friendsRepoImp);
  getIt.registerSingleton<MessagesRepoImp>(messagesRepoImp);

  

}