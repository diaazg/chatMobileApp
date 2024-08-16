import 'package:chat/core/presentation/ui/widgets/circular_image/my_story_circle.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/story_circule.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});
  List<double> zones = [.1, .09, .5];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(screenMainPadding),
        child: Column(
          children: [
            SizedBox(
              height: (screenSize.height - screenMainPadding) * zones[0],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PlatfromIcon(icon: "search", borderWhite: true),
                  Text(
                    'Home',
                    style: titleMedium.copyWith(fontSize: 30),
                  ),
                  PersonnalCirculairePic(screenSize: screenSize),
                ],
              ),
            ),
            SizedBox(
              height: (screenSize.height - screenMainPadding) * zones[1],
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? MyStoryCircle(
                            height: (screenSize.height - screenMainPadding) *
                                zones[1])
                        : StoryCircle(
                            height: (screenSize.height - screenMainPadding) *
                                zones[1]);
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
