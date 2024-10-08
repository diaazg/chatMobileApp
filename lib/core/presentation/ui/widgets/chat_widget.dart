import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.screenSize,
    required this.name,
    this.lastMessage = 'How are you today',
    this.state = '',
    this.numberOfLastMessages = 5,
    this.onTap
  });

  final Size screenSize;
  final String name;
  final String lastMessage;
  final String state;
  final int numberOfLastMessages;
  final void Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: PersonnalCirculairePic(screenSize: screenSize * 1.3),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: titleMedium.copyWith(fontSize: 20, color: Colors.black),
              ),
              Text(
                lastMessage,
                style: titleRegular.copyWith(
                    fontSize: ktextSize1 - 3, color: Colors.black54),
              ),
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  state,
                  style: titleRegular.copyWith(
                      fontSize: ktextSize1 - 3, color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Text(
                        numberOfLastMessages.toString(),
                        style: titleBold.copyWith(fontSize: 10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
