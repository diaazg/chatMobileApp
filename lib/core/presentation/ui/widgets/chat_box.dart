import 'package:chat/utils/colors.dart';
import 'package:chat/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatBox extends StatefulWidget {
  const ChatBox({
    super.key,
    required this.sendFunction,
  });

  final Function(String message) sendFunction;

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _controller = TextEditingController();
  bool messageEmpty = true;
  @override
  void initState() {
    
    super.initState();
    _controller.addListener(() {
      setState(() {
        if (_controller.text.isNotEmpty) {
          messageEmpty = false;
        } else {
          messageEmpty = true;
        }
      });
    });
  }

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
              controller: _controller,
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
        if (!messageEmpty)
          GestureDetector(
            onTap: () {
              widget.sendFunction(_controller.text);
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
        else
          const Row(
            children: [
              ImageIcon(
                AssetImage('$imagesPath/icons/camera.png'),
                size: 40,
              ),
              ImageIcon(
                AssetImage('$imagesPath/icons/mic.png'),
                size: 40,
              )
            ],
          )
      ],
    );
  }
}
