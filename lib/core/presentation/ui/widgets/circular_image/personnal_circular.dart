import 'package:chat/utils/constants.dart';
import 'package:chat/utils/extensions.dart';
import 'package:flutter/material.dart';

class PersonnalCirculairePic extends StatelessWidget {
  const PersonnalCirculairePic({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.responsiveHeight(screenSize.height),
      width: 50.0.responsiveHeight(screenSize.height),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('$imagesPath/profile.JPG'))),
    );
  }
}
