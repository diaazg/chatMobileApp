import 'package:chat/core/domain/models/message_model.dart';
import 'package:chat/core/presentation/ui/widgets/chat_box.dart';
import 'package:chat/core/presentation/ui/widgets/chat_screen_header.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/message_widget.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/strings.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final String userName = "Diaa zellagui";

  final String state = "Active now";

  List<MessageModel> mesages = [
    MessageModel(id: '1', isMe: false, content: 'Hey', time: DateTime.now()),
    MessageModel(
        id: '2', isMe: true, content: Strings.longText, time: DateTime.now()),
    MessageModel(
        id: '3', isMe: true, content: 'How are u', time: DateTime.now()),
    MessageModel(id: '4', isMe: false, content: 'fine', time: DateTime.now()),
    MessageModel(id: '5', isMe: false, content: 'wbu?', time: DateTime.now()),
    MessageModel(
        id: '6',
        isMe: false,
        content: 'Are you still angery ??',
        time: DateTime.now()),
    MessageModel(
        id: '7', isMe: true, content: 'No, I\'m not', time: DateTime.now()),
    MessageModel(
        id: '8', isMe: false, content: Strings.longText, time: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(screenMainPadding - 10),
        child: Column(
          children: [
            ChatScreenHeader(
                screenSize: screenSize, userName: userName, state: state),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  itemCount: mesages.length,
                  itemBuilder: (context, index) {
                    return MessageWidget(
                      screenWidth: screenSize.width,
                      height: 50.0.responsiveHeight(screenSize.height),
                      isMe: mesages[index].isMe,
                      content: mesages[index].content,
                    );
                  }),
            )),
            SizedBox(
              height: 60.0.responsiveHeight(screenSize.height),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ChatBox(
                  sendFunction: (String message) {
                    setState(() {
                       mesages.add(MessageModel(
                        id: 'st',
                        isMe: true,
                        content: message,
                        time: DateTime.now()));
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
