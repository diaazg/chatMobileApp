import 'package:chat/core/presentation/ui/widgets/buttons/sign_up_box.dart';
import 'package:chat/core/presentation/ui/widgets/custom_divide_line.dart';
import 'package:chat/core/presentation/ui/widgets/custom_form_field.dart';
import 'package:chat/core/presentation/ui/widgets/navigate_back.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/aligned_colored_text.dart';
import 'package:chat/utils/colors.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  final List<double> zones = [.03, .6, .3];

  @override
  Widget build(BuildContext context) {
    Size screenSzie = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(
            screenMainPadding.responsiveHeight(screenSzie.height)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: (screenSzie.height - screenMainPadding) * zones[0],
                  child: navigateBack(context)),
              SizedBox(
                height: (screenSzie.height - screenMainPadding) * zones[1],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AlignedColoredText(isRight: false, title: "Log in to Chatbox"),
                    SizedBox(height: 20.0.responsiveHeight(screenSzie.height)),
                    Text(
                      "Welcome back! Sign in using your social account or email to continue us",
                      textAlign: TextAlign.center,
                      style: titleRegular.copyWith(
                          color: Colors.black54, fontSize: ktextSize1),
                    ),
                    SizedBox(height: 20.0.responsiveHeight(screenSzie.height)),
                    const SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PlatfromIcon(icon: 'facebook', borderWhite: false),
                          PlatfromIcon(icon: 'google', borderWhite: false),
                          PlatfromIcon(icon: 'apple_black', borderWhite: false)
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0.responsiveHeight(screenSzie.height)),
                    const CustomDivideLine(isWhite: false),
                    SizedBox(height: 40.0.responsiveHeight(screenSzie.height)),
                    Form(
                        key: _formkey,
                        child: const Column(
                          children: [
                            CustomFormFieldWidget(
                              title: 'email',
                              obscure: false,
                            ),
                            SizedBox(height: 25),
                            CustomFormFieldWidget(
                              title: 'password',
                              obscure: true,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: (screenSzie.height - screenMainPadding) * zones[2],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        backColor: greenColors['mainGreen']!,
                        fontColor: Colors.white,
                        title: 'Log in'),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0.responsiveHeight(screenSzie.height),
                          horizontal: 0),
                      child: Text(
                        "Forget password?",
                        style: titleMedium.copyWith(
                            color: greenColors['mainGreen'],
                            fontSize: ktextSize1),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

