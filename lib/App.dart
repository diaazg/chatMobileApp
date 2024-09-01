import 'package:chat/utils/routes.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/navigationScreen',
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
    );
  }
}
