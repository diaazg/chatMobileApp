import 'package:chat/utils/colors.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomFormFieldWidget extends StatelessWidget {
  const CustomFormFieldWidget({
    super.key,
    required this.title,
    required this.obscure,
  });

  final String title;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    final String capitalizedTitle = title[0].toUpperCase() + title.substring(1);
    return TextFormField(
        obscureText: obscure,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          label: Text(
            capitalizedTitle,
            style: titleMedium.copyWith(color: greenColors['mainGreen'],fontSize: ktextSize1),
          ),
          errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: formFieldBorderColor['errorBorder']!)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: formFieldBorderColor['focuseBorder']!)),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: formFieldBorderColor['enabledBorder']!),
          ),
        ));
  }
}
