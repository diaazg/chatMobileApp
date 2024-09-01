import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    super.key,
    required this.screenWidth,
    required this.height,
    required this.isMe,
    required this.content,
  });

  final double screenWidth;
  final double height;
  final bool isMe;
  final String content;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Row(
        mainAxisAlignment:
            widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: isClicked ? 10 : 0),
            child: GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: widget.screenWidth * 0.5,
                      minWidth: widget.screenWidth * 0.2,
                      minHeight: widget.height,
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: widget.isMe
                            ? greenColors[
                                isClicked ? 'thirdGreen' : 'secondaryGreen']
                            : Colors.grey[isClicked ? 350 : 300],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.isMe ? 20 : 0),
                            bottomLeft: const Radius.circular(20),
                            bottomRight: const Radius.circular(20),
                            topRight: Radius.circular(widget.isMe ? 0 : 20))),
                    child: Text(
                      widget.content,
                      style: titleMedium.copyWith(
                          color: widget.isMe ? Colors.white : Colors.black,
                          fontSize: ktextSize1),
                    ),
                  ),
                  isClicked ? const Text('10:30 PM') : const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
