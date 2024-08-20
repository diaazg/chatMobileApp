import 'package:chat/core/presentation/ui/widgets/chat_box.dart';
import 'package:chat/core/presentation/ui/widgets/chat_screen_header.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  final String userName = "Diaa zellagui";
  final String state = "Active now";

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
                child: SizedBox(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.red,
                    height: 30,
                    width: 100,
                    );
                }
                ),
            )),
            SizedBox(
              height: 60.0.responsiveHeight(screenSize.height),
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: ChatBox(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
