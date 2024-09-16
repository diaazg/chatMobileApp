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
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final int uid = args['uid'];
    final int fid = args['fid'];
    final String userName = args['userName'];

    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(screenMainPadding - 10),
        child: BlocProvider(
          create: (context) => ChatCubit(uid, fid),
          child: BlocConsumer<ChatCubit, ChatState>(
            listener: (BuildContext context, ChatState state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<ChatCubit>(context);

              return Column(
                children: [
                  ChatScreenHeader(
                      screenSize: screenSize,
                      userName: userName,
                      state: 'state'),
                  if (state is ChatStateLoading)
                    const Expanded(
                        child: Center(child: Text('wait...........')))
                  else
                    (state is ChatStateFailure)
                        ? const Expanded(child: Center(child: Text('err')))
                        : Expanded(
                            child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListView.builder(
                                controller: cubit.scrollController,
                                itemCount: cubit.messages.length,
                                itemBuilder: (context, index) {
                                  return MessageWidget(
                                    screenWidth: screenSize.width,
                                    height: 50.0
                                        .responsiveHeight(screenSize.height),
                                    isMe: cubit.messages[index].sender == 5,
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
                                  sender: 5, receiver: 4, message: message)
                              .toJson();
                          if (state is! ChatStateFailure) {
                            cubit.sendMessage(messageModel);
                          }
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
