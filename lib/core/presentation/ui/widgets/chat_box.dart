import 'package:chat/utils/colors.dart';
import 'package:chat/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatBox extends StatelessWidget {
   ChatBox({
    super.key, required this.sendFunction,
  });


  final Function(String message) sendFunction;
  final TextEditingController _controller = TextEditingController();

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
            child: TextFormField(
              controller:_controller ,
              
              decoration: const InputDecoration(
                
                contentPadding: EdgeInsets.all(10),
                hintText: 'Write a message',
                border: InputBorder.none,
                suffixIcon: ImageIcon(
                  AssetImage('$imagesPath/icons/files.png'),
                  size: 40,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
           
            if(_controller.text.isNotEmpty){
              
              sendFunction(_controller.text);
              
            }
          },
          child: CircleAvatar(
            backgroundColor: greenColors['secondaryGreen'],
            radius: 40,
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
