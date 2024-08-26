import 'package:chat/core/presentation/ui/screens/Home_screen.dart';
import 'package:chat/core/presentation/ui/screens/auth/login_screen.dart';
import 'package:chat/core/presentation/ui/screens/auth/signup_screen.dart';
import 'package:chat/core/presentation/ui/screens/camera/camera_preview_screen.dart';
import 'package:chat/core/presentation/ui/screens/camera/image_preview.dart';
import 'package:chat/core/presentation/ui/screens/chat_screen.dart';
import 'package:chat/core/presentation/ui/screens/contact_screen.dart';
import 'package:chat/core/presentation/ui/screens/messages_screen.dart';
import 'package:chat/core/presentation/ui/screens/navigation_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomeScreen(),
    '/loginScreen': (context) => LoginScreen(),
    '/signupScreen': (context) => SignupScreen(),
    '/messagesScreen': (context) =>  MessagesScreen(),
    '/navigationScreen': (context) => const NavigationScreen(),
    '/chatScreen': (context) => const ChatScreen(),
    '/imagePreview': (context) => const ImageViewPage(),
    '/cameraPreview': (context) => const CameraPreviewScreen(),
    '/contactScreen':(context)=> ContactsScreen()
  };
}
