import 'package:chat/core/presentation/ui/widgets/custom_splash_title.dart';
import 'package:chat/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('$imagesPath/back.jpg'))),
          child: const SizedBox(
            width: double.infinity,
            child:  SplashText(),
          )),
    ));
  }
}

