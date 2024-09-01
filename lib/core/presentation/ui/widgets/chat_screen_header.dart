import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/core/presentation/ui/widgets/navigate_back.dart';
import 'package:chat/utils/other/constants.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';

class ChatScreenHeader extends StatelessWidget {
  const ChatScreenHeader({
    super.key,
    required this.screenSize,
    required this.userName,
    required this.state,
  });

  final Size screenSize;
  final String userName;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        navigateBack(context),
        Row(
          children: [
            PersonnalCirculairePic(screenSize: screenSize),
            const SizedBox(width: 20),
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
    );
  }
}
