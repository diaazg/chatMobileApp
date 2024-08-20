import 'package:chat/utils/colors.dart';
import 'package:chat/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ImageIcon(
          AssetImage('$imagesPath/icons/Attachment.png'),
          size: 40,
        ),
        Container(
          width: 250,
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: ImageIcon(
                    AssetImage('$imagesPath/icons/files.png'),
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        )
       ,CircleAvatar(
        backgroundColor: greenColors['secondaryGreen'],
        radius: 40,
        child: const Icon(Icons.send,color: Colors.white,),
       )
      ],
    );
  }
}
