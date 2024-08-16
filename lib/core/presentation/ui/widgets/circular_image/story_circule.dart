import 'package:chat/utils/constants.dart';
import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({
    super.key, required this.height, 
   
  });

  final double height;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(right: 20),
      height: height,
      width: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple, Colors.redAccent]),
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration:
            const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('$imagesPath/profile.JPG')),
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}
