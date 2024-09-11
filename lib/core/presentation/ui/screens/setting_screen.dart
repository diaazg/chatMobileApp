import 'package:chat/core/data/data_sources/local/shared_pref.dart';
import 'package:chat/core/presentation/state/bloc/auth/auth_cubit.dart';
import 'package:chat/core/presentation/state/bloc/auth/auth_state.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/extensions.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: screenMainPadding,
                  right: screenMainPadding,
                  left: screenMainPadding),
              child: SizedBox(
                height: (screenSize.height - screenMainPadding) * zones[0],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(
                      color: Colors.white,
                    ),
                    Text(
                      'Setting',
                      style: titleMedium.copyWith(fontSize: 30),
                    ),
                    SizedBox(
                      width: screenSize.width * .2,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0.responsiveHeight(screenSize.height)),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: screenMainPadding + 10, vertical: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  constraints: BoxConstraints(
                    minHeight:
                        (screenSize.height - screenMainPadding) * zones[2],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<AuthCubit,AuthState>(
                        builder: (context,state) {
                          final cubit = BlocProvider.of<AuthCubit>(context);
                          return ListTile(
                            leading: PersonnalCirculairePic(
                                screenSize: screenSize * 1.5),
                            title: Text(
                              cubit.userModel.username??'',
                              style: titleBold.copyWith(
                                  fontSize: ktextSize1 + 5, color: Colors.black),
                            ),
                            subtitle:  Text(cubit.userModel.profileTitle??''),
                            trailing: Icon(
                              Icons.qr_code_scanner_sharp,
                              color: greenColors['mainGreen'],
                            ),
                          );
                        }
                      ),
                      const Divider(
                          thickness: 2, height: 2, color: Color(0xAAF5F6F6)),
                      GestureDetector(
                        onTap: () async {
                          await clearTokenFromLocalStorage();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, '/');
                        },
                        child: ListTile(
                          title: Text(
                            'Log out',
                            style: titleBold.copyWith(
                                fontSize: ktextSize1 + 5, color: Colors.black),
                          ),
                           trailing: Icon(
                          Icons.logout_outlined,
                          color: greenColors['mainGreen'],
                        ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
