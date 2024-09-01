import 'package:chat/core/presentation/ui/screens/Home_screen.dart';
import 'package:chat/core/presentation/ui/screens/auth/login_screen.dart';
import 'package:chat/core/presentation/ui/screens/auth/register_screen.dart';
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
    '/messagesScreen': (context) =>  const MessagesScreen(),
    '/navigationScreen': (context) => const NavigationScreen(),
    '/chatScreen': (context) => const ChatScreen(),
    '/imagePreview': (context) =>  ImageViewPage(),
    '/cameraPreview': (context) => const CameraPreviewScreen(),
    '/contactScreen':(context)=> const ContactsScreen(),
    '/auth/login':(context) =>  LoginScreen(),
    '/auth/register': (context) => RegisterScreen()
  };
}
