import 'package:chat/core/presentation/ui/widgets/chat_widget.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/my_story_circle.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/story_circule.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<double> zones = [.1, .12, .8];
  final items = List<String>.generate(15, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
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
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: screenMainPadding - 5, vertical: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  constraints: BoxConstraints(
                    minHeight: (screenSize.height - screenMainPadding) * zones[2],
                    
                  ),
                  child: items.isNotEmpty
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return Dismissible(
                              
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: AlignmentDirectional.centerEnd,
                                margin: const EdgeInsets.all(10),
                                child: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.red,
                                    child: Icon(Icons.delete_outline,color: Colors.white,),
                                                              
                                  )
                              ),
                
                              key: Key(item),
                              onDismissed: (direction) {
                                setState(() {
                                  items.removeAt(index);
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('$item dismissed')));
                              },
                              child: ChatWidget(screenSize: screenSize),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: items.length,
                        )
                      : Center(
                          child: Text(
                            "No chats",
                            style: titleBold.copyWith(fontSize: 50,color: Colors.black),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
