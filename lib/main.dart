import 'package:chat/App.dart';
import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/utils/classes/camera.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



void main()async {
  setup();
  final camera = getIt<Camera>();
  final authRepoImp = getIt<AuthRepoImp>();
  
  WidgetsFlutterBinding.ensureInitialized();
  camera.getCamerasList();
  await dotenv.load(fileName: ".env");
  
  runApp( ChatApp(authRepoImp: authRepoImp));
}

