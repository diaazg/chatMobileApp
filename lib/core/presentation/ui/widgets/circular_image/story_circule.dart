import 'package:chat/utils/other/constants.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: height*0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              
              height: height*.7,
              width: height*.7,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple, Colors.redAccent]),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration:
                    const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('$imagesPath/profile.JPG')),
                      shape: BoxShape.circle),
                child: Container(
                  alignment: Alignment.bottomRight,
                  
            
                ),
                ),
              ),
            ),
            Text("Stika",style: titleMedium.copyWith(fontSize: 15),overflow:TextOverflow.ellipsis ,)
          ],
        ),
      ),
    );
  }
}
