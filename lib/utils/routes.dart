import 'package:chat/core/presentation/ui/screens/Home_screen.dart';
import 'package:chat/core/presentation/ui/screens/auth/login_screen.dart';
import 'package:chat/core/presentation/ui/screens/auth/signup_screen.dart';
import 'package:chat/core/presentation/ui/screens/messages_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Map<String,WidgetBuilder> routes = {
        '/':(context) => const HomeScreen(),
        '/loginScreen':(context) => LoginScreen(),
        '/signupScreen':(context) =>  SignupScreen(),
        '/messagesScreen':(context) =>  MessagesScreen()
      };
}