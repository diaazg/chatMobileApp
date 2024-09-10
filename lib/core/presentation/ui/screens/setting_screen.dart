import 'package:chat/core/data/data_sources/local/shared_pref.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/extensions.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';

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
                      ListTile(
                        leading: PersonnalCirculairePic(
                            screenSize: screenSize * 1.5),
                        title: Text(
                          'Diaa zellagui',
                          style: titleBold.copyWith(
                              fontSize: ktextSize1 + 5, color: Colors.black),
                        ),
                        subtitle: const Text('Never give up'),
                        trailing: Icon(
                          Icons.qr_code_scanner_sharp,
                          color: greenColors['mainGreen'],
                        ),
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
