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
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('$imagesPath/back.jpg'))),
          child: SizedBox(
            
            width: double.infinity,
            child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(4, (index) {
              return Text(
                Strings.welcomPageTitle.getWord(index),
                style: index <=1?splashTitleMedium:splashTitleBold,
              );
            })),
          )),
    ));
  }
}
