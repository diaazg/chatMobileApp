import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.screenSize, required this.name,
  });

  final Size screenSize;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
         
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PersonnalCirculairePic(screenSize: screenSize * 1.3),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: titleMedium.copyWith(
                      fontSize: 20, color: Colors.black),
                ),
                Text(
                  "How are you today?",
                  style: titleRegular.copyWith(
                      fontSize: ktextSize1 - 3,
                      color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "2 min ago",
                style: titleRegular.copyWith(
                    fontSize: ktextSize1 - 3,
                    color: Colors.black54),
              ),
            
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Center(
                    child: Text(
                      "5",
                      style: titleBold.copyWith(fontSize: 10),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
