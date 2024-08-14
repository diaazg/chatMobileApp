import 'package:chat/utils/constants.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/strings.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('$imagesPath/back.jpg'))),
          child: Center(
            child: Text(
              Strings.welcomPageTitle.getWord(1),
              style: splashTitle,
            ),
          )),
    ));
  }
}
