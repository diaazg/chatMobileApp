import 'package:chat/App.dart';
import 'package:chat/core/presentation/state/classes/camera.dart';
import 'package:chat/core/presentation/state/classes/get_it.dart';
import 'package:flutter/material.dart';



void main() {
  setup();
  final camera = getIt<Camera>();
  
  WidgetsFlutterBinding.ensureInitialized();
  camera.getCamerasList();
  
  
  runApp(const ChatApp());
}

