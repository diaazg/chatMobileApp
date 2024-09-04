import 'package:chat/App.dart';
import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/utils/classes/camera.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter/material.dart';



void main() {
  setup();
  final camera = getIt<Camera>();
  final authRepoImp = getIt<AuthRepoImp>();
  
  WidgetsFlutterBinding.ensureInitialized();
  camera.getCamerasList();
  
  
  runApp( ChatApp(authRepoImp: authRepoImp));
}

