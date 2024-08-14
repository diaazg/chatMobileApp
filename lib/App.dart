import 'package:chat/core/presentation/ui/screens/Home_screen.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      home: HomeScreen(),
    );
  }
}