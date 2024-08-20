import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/core/presentation/ui/widgets/navigate_back.dart';
import 'package:chat/utils/constants.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(screenMainPadding - 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navigateBack(context),
                PersonnalCirculairePic(screenSize: screenSize),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: titleMedium.copyWith(
                          color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      state,
                      style: titleRegular.copyWith(
                          color: Colors.black45, fontSize: ktextSize1),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    ImageIcon(AssetImage('$imagesPath/icons/CallChat.png')),
                    SizedBox(width: 20),
                    ImageIcon(AssetImage('$imagesPath/icons/Video.png'))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
