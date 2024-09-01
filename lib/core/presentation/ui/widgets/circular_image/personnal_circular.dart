import 'package:chat/utils/other/constants.dart';
import 'package:chat/utils/other/extensions.dart';
import 'package:flutter/material.dart';

class PersonnalCirculairePic extends StatelessWidget {
  const PersonnalCirculairePic({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;
  

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius:25.0.responsiveHeight(screenSize.height) ,
      backgroundImage:const AssetImage('$imagesPath/profile.JPG') ,
    );
  }
}


