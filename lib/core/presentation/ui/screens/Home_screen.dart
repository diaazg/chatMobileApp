import 'package:chat/core/presentation/ui/widgets/buttons/sign_up_box.dart';
import 'package:chat/core/presentation/ui/widgets/custom_divide_line.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/custom_splash_title.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/login_text.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/utils/constants.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:chat/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.all(screenMainPadding),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('$imagesPath/back.jpg'))),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const Image(image: AssetImage('$imagesPath/logo.png')),
                SizedBox(height: 20.0.responsiveHeight(screenSize.height)),
                const SplashText(),
                SizedBox(height: 20.0.responsiveHeight(screenSize.height)),
                const Text(
                  Strings.welcomPageSubTitle,
                  style: TextStyle(color: Colors.white38, fontSize: 18),
                ),
                SizedBox(height: 20.0.responsiveHeight(screenSize.height)),
                const SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlatfromIcon(icon: 'facebook', borderWhite: true),
                      PlatfromIcon(icon: 'google', borderWhite: true),
                      PlatfromIcon(icon: 'apple', borderWhite: true)
                    ],
                  ),
                ),
                SizedBox(height: 20.0.responsiveHeight(screenSize.height)),
                const CustomDivideLine(
                  isWhite: true,
                ),
                SizedBox(height: 20.0.responsiveHeight(screenSize.height)),
                 CustomButton(
                  onTap: (){
                        Navigator.pushNamed(context, '/auth/register');
                  },
                  title: 'Sign up withn mail',
                  backColor: Colors.white,
                  fontColor: Colors.black,
                ),
                SizedBox(height: 20.0.responsiveHeight(screenSize.height)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/auth/login');
                    },
                    child: const LoginText())
              ],
            ),
          )),
    ));
  }
}
