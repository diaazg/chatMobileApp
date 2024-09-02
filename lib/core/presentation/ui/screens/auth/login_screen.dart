import 'package:chat/core/presentation/state/bloc/auth/login/login_cubit.dart';
import 'package:chat/core/presentation/state/bloc/auth/login/login_state.dart';
import 'package:chat/core/presentation/state/bloc/box/box_cubit.dart';
import 'package:chat/core/presentation/ui/widgets/buttons/sign_up_box.dart';
import 'package:chat/core/presentation/ui/widgets/custom_divide_line.dart';
import 'package:chat/core/presentation/ui/widgets/custom_form_field.dart';
import 'package:chat/core/presentation/ui/widgets/navigate_back.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/aligned_colored_text.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/extensions.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:chat/utils/other/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  final List<double> zones = [.03, .6, .3];
  final BoxCubit usernameCubit = BoxCubit(usernameValidator);
  final BoxCubit passwordCubit = BoxCubit(passwordValidator);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (BuildContext context, Object? state) {
            if(state is LoginStateFailure){
              print('Faaaaaaaaaa----------------------------');
              print(state.error);
            }else if(state is LoginStateSuccess){
              print('Succccccccccccccccceeeeeeeeeeees------------------');
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<LoginCubit>(context);
            return Padding(
              padding: EdgeInsets.all(
                  screenMainPadding.responsiveHeight(screenSize.height)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height:
                            (screenSize.height - screenMainPadding) * zones[0],
                        child: navigateBack(context)),
                    SizedBox(
                      height:
                          (screenSize.height - screenMainPadding) * zones[1],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AlignedColoredText(
                              isRight: false, title: "Log in to Chatbox"),
                          SizedBox(
                              height: 20.0.responsiveHeight(screenSize.height)),
                          Text(
                            "Welcome back! Sign in using your social account or email to continue us",
                            textAlign: TextAlign.center,
                            style: titleRegular.copyWith(
                                color: Colors.black54, fontSize: ktextSize1),
                          ),
                          SizedBox(
                              height: 20.0.responsiveHeight(screenSize.height)),
                          const SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PlatfromIcon(
                                    icon: 'facebook', borderWhite: false),
                                PlatfromIcon(
                                    icon: 'google', borderWhite: false),
                                PlatfromIcon(
                                    icon: 'apple_black', borderWhite: false)
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 20.0.responsiveHeight(screenSize.height)),
                          const CustomDivideLine(isWhite: false),
                          SizedBox(
                              height: 40.0.responsiveHeight(screenSize.height)),
                          Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  CustomFormFieldWidget(
                                    title: 'username',
                                    obscure: false,
                                    cubit: usernameCubit,
                                  ),
                                  SizedBox(
                                      height: 25.0
                                          .responsiveHeight(screenSize.height)),
                                  CustomFormFieldWidget(
                                    title: 'password',
                                    obscure: true,
                                    cubit: passwordCubit,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:
                          (screenSize.height - screenMainPadding) * zones[2],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            backColor: greenColors['mainGreen']!,
                            fontColor: Colors.white,
                            title: (state is LoginStateLoading)?'Waiit..':'Log in' ,
                            onTap: () {
                              usernameCubit.validate();
                              passwordCubit.validate();

                              Future.delayed(const Duration(milliseconds: 100),
                                  () async {
                                if (_formkey.currentState!.validate()) {
                                  String email = usernameCubit.input;
                                  String password = passwordCubit.input;
                                  cubit.login(email, password);
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    10.0.responsiveHeight(screenSize.height),
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
            );
          },
        ),
      )),
    );
  }
}
