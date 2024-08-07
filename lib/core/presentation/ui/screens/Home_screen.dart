import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:Scaffold(
        backgroundColor: Colors.amber,
        body:Center(
          child: Text(
               'Hello',
               style:splashTitle,
          ),
        )
      ) 
    
    );
  }
}