import 'package:chat/core/presentation/state/bloc/box/box_cubit.dart';
import 'package:chat/core/presentation/ui/widgets/buttons/sign_up_box.dart';
import 'package:chat/core/presentation/ui/widgets/custom_form_field.dart';
import 'package:chat/core/presentation/ui/widgets/navigate_back.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/aligned_colored_text.dart';
import 'package:chat/utils/other/extensions.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:chat/utils/other/validators.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final List<double> zones = [.03, .7, .2];
  final _formkey = GlobalKey<FormState>();
  final BoxCubit emailCubit = BoxCubit(emailValidator);
  final BoxCubit passwordCubit = BoxCubit(passwordValidator);
  final BoxCubit usernameCubit = BoxCubit(usernameValidator);
  final BoxCubit confirmPasswordCubit = BoxCubit(passwordValidator);

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
                            CustomFormFieldWidget(
                              title: 'name',
                              obscure: false,
                              cubit: usernameCubit,
                            ),
                            SizedBox(
                                height:
                                    25.0.responsiveHeight(screenSize.height)),
                            CustomFormFieldWidget(
                              title: 'email',
                              obscure: false,
                              cubit: emailCubit,
                            ),
                            SizedBox(
                                height:
                                    25.0.responsiveHeight(screenSize.height)),
                            CustomFormFieldWidget(
                              title: 'password',
                              obscure: true,
                              cubit: passwordCubit,
                            ),
                            SizedBox(
                                height:
                                    25.0.responsiveHeight(screenSize.height)),
                            CustomFormFieldWidget(
                              title: 'confirm password',
                              obscure: true,
                              cubit: confirmPasswordCubit,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: (screenSize.height - screenMainPadding) * zones[2],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      backColor: const Color(0xFFF3F6F6),
                      fontColor: const Color(0xFF797C7B),
                      title: 'Create an account',
                      onTap: () {
                        usernameCubit.validate();
                        emailCubit.validate();
                        passwordCubit.validate();
                        final password = passwordCubit.input;

                        confirmPasswordCubit.check(password,'Passwords are not the same');
                        Future.delayed(const Duration(milliseconds: 100),
                            () async {
                          if (_formkey.currentState!.validate()) {
                            
                          }
                        });
                      },
                    ),
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
