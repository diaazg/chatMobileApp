import 'package:chat/core/presentation/ui/widgets/buttons/sign_up_box.dart';
import 'package:chat/core/presentation/ui/widgets/custom_divide_line.dart';
import 'package:chat/core/presentation/ui/widgets/custom_splash_title.dart';
import 'package:chat/core/presentation/ui/widgets/login_text.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:chat/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('$imagesPath/back.jpg'))),
          child: const SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Image(image: AssetImage('$imagesPath/logo.png')),
                SizedBox(height: 20),
                SplashText(),
                SizedBox(height: 20),
                Text(
                  Strings.welcomPageSubTitle,
                  style: TextStyle(color: Colors.white38, fontSize: 18),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlatfromIcon(icon: 'facebook'),
                      PlatfromIcon(icon: 'google'),
                      PlatfromIcon(icon: 'apple')
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomDivideLine(),
                SizedBox(height: 20),
                SignUpButton(),
                SizedBox(height: 20),
                LoginText()
              ],
            ),
          )),
    ));
  }
}

