import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';

class AlignedColoredText extends StatelessWidget {
  const AlignedColoredText({
    super.key,
    required this.isRight, required this.title,
  });
   
  final String title; 
  final bool isRight;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isRight
            ? Positioned(
                top: 20,
                right: 0,
                child: Container(
                  height: 10,
                  width: 60,
                  color: greenColors['secondaryGreen'],
                ))
            : Positioned(
                top: 20,
                child: Container(
                  height: 10,
                  width: 60,
                  color: greenColors['secondaryGreen'],
                )),
        Positioned(
            child: Text(
          title,
          style: titleBold.copyWith(fontSize: 20, color: Colors.black),
        ))
      ],
    );
  }
}
