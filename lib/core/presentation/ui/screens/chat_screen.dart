import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/core/presentation/state/bloc/chat/chat_cubit.dart';
import 'package:chat/core/presentation/state/bloc/chat/chat_state.dart';
import 'package:chat/core/presentation/ui/widgets/chat_box.dart';
import 'package:chat/core/presentation/ui/widgets/chat_screen_header.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/message_widget.dart';
import 'package:chat/utils/other/extensions.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final Map<String, dynamic> args =
    //ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(screenMainPadding - 10),
        child: BlocProvider(
          create: (context) => ChatCubit('4', '5'),
          child: BlocConsumer<ChatCubit, ChatState>(
            listener: (BuildContext context, ChatState state) {
              if (state is ChatStateCloseSocket) {
                Navigator.pushNamed(context, '/navigationScreen');
              }
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<ChatCubit>(context);

              return Column(
                  children: [
                    ChatScreenHeader(
                        screenSize: screenSize,
                        userName: cubit.userName,
                        state: 'state'),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                          itemCount: cubit.messages.length,
                          itemBuilder: (context, index) {
                            return MessageWidget(
                              screenWidth: screenSize.width,
                              height: 50.0.responsiveHeight(screenSize.height),
                              isMe: cubit.messages[index].sender == 4,
                              content: cubit.messages[index].message,
                            );
                          }),
                    )),
                    SizedBox(
                      height: 60.0.responsiveHeight(screenSize.height),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ChatBox(
                          sendFunction: (String message) {
                            Map<String, dynamic> messageModel = MessageModel(
                                    sender: 4, receiver: 5, message: message)
                                .toJson();
                            cubit.sendMessage(messageModel);
                          },
                        ),
                      ),
                    )
                  ],
                );
            },
          ),
        ),
      ),
    ));
  }
}
