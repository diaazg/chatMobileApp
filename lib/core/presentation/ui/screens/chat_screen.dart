import 'package:chat/core/data/data_sources/local/local_auth.dart';
import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/presentation/state/bloc/chat/chat_cubit.dart';
import 'package:chat/core/presentation/state/bloc/chat/chat_state.dart';
import 'package:chat/core/presentation/ui/widgets/chat_box.dart';
import 'package:chat/core/presentation/ui/widgets/chat_screen_header.dart';
import 'package:chat/core/presentation/ui/widgets/load_image.dart';
import 'package:chat/core/presentation/ui/widgets/text_widgets/message_widget.dart';
import 'package:chat/core/presentation/ui/widgets/voice_widget.dart';
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
            listener: (BuildContext context, ChatState state) async {
              if (state is ChatStateVideoCall) {
                UserModel userModel = await getUserInfoFromLocalStorage();
                Map<String, dynamic> args = {
                  'uid': uid.toString(),
                  'roomID': state.roomID,
                  'userName': userModel.username
                };

                Navigator.pushNamed(context, '/video_call', arguments: args);
              }
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<ChatCubit>(context);

              return Column(
                children: [
                  ChatScreenHeader(
                      onTap: () {
                        Map<String, dynamic> data = {};

                        cubit.sendMessage(data, 'start_call');
                      },
                      screenSize: screenSize,
                      userName: userName,
                      state: cubit.activeState),
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
                                  if (cubit.messages[index].type == "text") {
                                    return MessageWidget(
                                      screenWidth: screenSize.width,
                                      height: 50.0
                                          .responsiveHeight(screenSize.height),
                                      isMe: cubit.messages[index].sender == uid,
                                      content:
                                          cubit.messages[index].textContent ??
                                              cubit.messages[index].audioFile!,
                                    );
                                  } else if (cubit.messages[index].type ==
                                      "audio") {
                                    return VoiceWidget(
                                      audioName:
                                          cubit.messages[index].audioFile!,
                                      isMe: cubit.messages[index].sender == uid,
                                      screenWidth: screenSize.width,
                                      height: 50.0
                                          .responsiveHeight(screenSize.height),
                                    );
                                  } else {
                                    return LoadImage(
                                      image: cubit.messages[index].imageFile!,
                                    );
                                  }
                                }),
                          )),
                  SizedBox(
                    height: 60.0.responsiveHeight(screenSize.height),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ChatBox(
                        sendFunction: (String message, String type) {
                          Map<String, dynamic> messageModel = MessageModel(
                                  sender: uid,
                                  receiver: fid,
                                  textContent: message)
                              .toJson();
                          if (state is! ChatStateFailure) {
                            if (type == "text") {
                              cubit.sendMessage(messageModel, 'send');
                            } else {
                              cubit.sendMessage(messageModel, 'audio');
                            }
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

