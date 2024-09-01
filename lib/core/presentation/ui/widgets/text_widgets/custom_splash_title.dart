import 'package:chat/utils/other/extensions.dart';
import 'package:chat/utils/other/strings.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';

class SplashText extends StatelessWidget {
  const SplashText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(4, (index) {
          return Text(
            Strings.welcomPageTitle.getWord(index),
            style: index <= 1 ? titleRegular : titleBold,
          );
        }));
  }
}
