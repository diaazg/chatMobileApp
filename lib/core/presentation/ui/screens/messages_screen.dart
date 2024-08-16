import 'package:chat/core/presentation/ui/widgets/circular_image/my_story_circle.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/story_circule.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});
  List<double> zones = [.1, .12, .5];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: screenMainPadding,
                right: screenMainPadding,
                left: screenMainPadding),
            child: SizedBox(
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
          ),
          SizedBox(
            height: (screenSize.height - screenMainPadding) * zones[1],
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return index == 0
                      ? MyStoryCircle(
                          height: (screenSize.height - screenMainPadding) *
                              zones[1])
                      : StoryCircle(
                          height: (screenSize.height - screenMainPadding) *
                              zones[1]);
                }),
          ),
          SizedBox(height: 30.0.responsiveHeight(screenSize.height)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: screenMainPadding - 5,vertical: 5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              child: ListView.separated(
                itemBuilder: (context,index){
                 return ChatWidget(screenSize: screenSize);
              }, separatorBuilder: (context,index){
                return const SizedBox(height: 10,);
              }, itemCount: 10)
            ),
          )
        ],
      ),
    ));
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
         
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PersonnalCirculairePic(screenSize: screenSize * 1.3),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Diaa Zellagui",
                  style: titleMedium.copyWith(
                      fontSize: 20, color: Colors.black),
                ),
                Text(
                  "How are you today?",
                  style: titleRegular.copyWith(
                      fontSize: ktextSize1 - 3,
                      color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
        Column(
          
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "2 min ago",
              style: titleRegular.copyWith(
                  fontSize: ktextSize1 - 3,
                  color: Colors.black54),
            ),
          
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CircleAvatar(
              
                radius: 12,
                backgroundColor: Colors.red,
                child: Center(
                  child: Text(
                    "5",
                    style: titleBold.copyWith(fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
