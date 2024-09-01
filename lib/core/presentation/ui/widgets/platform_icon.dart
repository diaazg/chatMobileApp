import 'package:chat/utils/other/constants.dart';
import 'package:flutter/material.dart';

class PlatfromIcon extends StatelessWidget {
  const PlatfromIcon({super.key, required this.icon,required this.borderWhite});

  final String icon;
  final bool borderWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: borderWhite?Colors.white:Colors.black, width: 1)),
      child: Image.asset('$imagesPath/platform/$icon.png'),
    );
  }
}
