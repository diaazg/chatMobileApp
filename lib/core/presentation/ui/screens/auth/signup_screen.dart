import 'package:chat/core/presentation/ui/widgets/buttons/sign_up_box.dart';
import 'package:chat/core/presentation/ui/widgets/custom_form_field.dart';
import 'package:chat/core/presentation/ui/widgets/navigate_back.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/aligned_colored_text.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final List<double> zones = [.03, .7, .2];
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(screenMainPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: (screenSize.height - screenMainPadding) * zones[0],
                  child: navigateBack(context)),
              SizedBox(
                height: (screenSize.height - screenMainPadding) * zones[1],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AlignedColoredText(
                        isRight: true, title: "Sign up with Email"),
                    SizedBox(height: 20.0.responsiveHeight(screenSize.height)),
                    Text(
                      "Get chatting with friends and family today by signing up for our chat app!",
                      textAlign: TextAlign.center,
                      style: titleRegular.copyWith(
                          color: Colors.black54, fontSize: ktextSize1),
                    ),
                    Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            const CustomFormFieldWidget(
                              title: 'name',
                              obscure: false,
                            ),
                            SizedBox(
                                height:
                                    25.0.responsiveHeight(screenSize.height)),
                            const CustomFormFieldWidget(
                              title: 'email',
                              obscure: false,
                            ),
                            SizedBox(
                                height:
                                    25.0.responsiveHeight(screenSize.height)),
                            const CustomFormFieldWidget(
                              title: 'password',
                              obscure: true,
                            ),
                            SizedBox(
                                height:
                                    25.0.responsiveHeight(screenSize.height)),
                            const CustomFormFieldWidget(
                              title: 'confirm password',
                              obscure: true,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: (screenSize.height - screenMainPadding) * zones[2],
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        backColor: Color(0xFFF3F6F6),
                        fontColor: Color(0xFF797C7B),
                        title: 'Create an account'),
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
