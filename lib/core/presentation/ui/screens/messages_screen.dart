import 'package:chat/core/presentation/state/bloc/messages/messages_cubit.dart';
import 'package:chat/core/presentation/state/bloc/messages/messages_state.dart';
import 'package:chat/core/presentation/ui/widgets/chat_widget.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/my_story_circle.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/personnal_circular.dart';
import 'package:chat/core/presentation/ui/widgets/circular_image/story_circule.dart';
import 'package:chat/core/presentation/ui/widgets/custom_swip_widget.dart';
import 'package:chat/core/presentation/ui/widgets/platform_icon.dart';
import 'package:chat/utils/extensions.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => MessagesCubit(),
        child: BlocBuilder<MessagesCubit,MessagesState>(
          builder: (context, state) {
          final cubit = context.read<MessagesCubit>();
          return Column(
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
                    itemCount: cubit.friendsStories,
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
                      minHeight:
                          (screenSize.height - screenMainPadding) * zones[2],
                    ),
                    child: cubit.friendsMessages.isNotEmpty
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final item = cubit.friendsMessages[index];
                              return LimitedSwipeWidget(
                                key: ValueKey(item), // Assigning unique Key
                                swipeLimit: 200.0,
                                onDelete: () {
                                  cubit.deleteChat(index);
                                },
                                child: ChatWidget(
                                  screenSize: screenSize,
                                  name: item,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: cubit.friendsMessages.length,
                          )
                        : Center(
                            child: Text(
                              "No chats",
                              style: titleBold.copyWith(
                                  fontSize: 50, color: Colors.black),
                            ),
                          ),
                  );
                },
              ),
           
            ],
          );
        }),
      )),
    ));
  }
}
