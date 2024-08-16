import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.backColor, required this.fontColor, required this.title,
  });

  final Color backColor;
  final Color fontColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(title,
              style: titleMedium.copyWith(
                  color: fontColor, fontSize: ktextSize1)),
        ),
      ),
    );
  }
}
