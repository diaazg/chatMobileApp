import 'package:chat/core/presentation/state/bloc/chat/chat_cubit.dart';
import 'package:chat/core/presentation/state/bloc/chat_box/chat_box_cubit.dart';
import 'package:chat/core/presentation/state/bloc/chat_box/chat_box_state.dart';
import 'package:chat/core/presentation/ui/widgets/custom_record_wave_widget.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatBox extends StatelessWidget {
  const ChatBox({
    super.key,
    required this.sendFunction,
  });

  final Function(String message,String type) sendFunction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChatBoxCubit(),
        child:BlocConsumer<ChatBoxCubit, ChatBoxState>(
          listener: (context,state){
            if (state is ChatBoxStateStopRecord){

              sendFunction(state.audioFile!,'audio');
              
            }
          },
        builder: (context, state) {
           final cubit = context.read<ChatBoxCubit>();
           return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ImageIcon(
                AssetImage('$imagesPath/icons/Attachment.png'),
                size: 40,
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: cubit.isRecording
                      ? const CustomRecordingWaveWidget()
                      : TextFormField(
                          controller: cubit.controller,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Write a message',
                            border: InputBorder.none,
                            suffixIcon: ImageIcon(
                              AssetImage('$imagesPath/icons/files.png'),
                              size: 40,
                            ),
                          ),
                        ),
                ),
              ),
              if (!cubit.messageEmpty)
                GestureDetector(
                  onTap: () {
                    sendFunction(cubit.controller.text,'text');
                    cubit.clearInput();
                  },
                  child: CircleAvatar(
                    backgroundColor: greenColors['secondaryGreen'],
                    radius: 30,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                )
              else
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        requestStoragePermission();
                        Navigator.pushNamed(
                          context,
                          '/cameraPreview',
                          arguments: {
                            'chatCubit': context.read<ChatCubit>()
                          }
                          );
                      },
                      child: const ImageIcon(
                        AssetImage('$imagesPath/icons/camera.png'),
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onLongPressUp: cubit.record,
                      onLongPress: cubit.record,
                      child: const ImageIcon(
                        AssetImage('$imagesPath/icons/mic.png'),
                        size: 30,
                      ),
                    )
                  ],
                )
            ],
          );
        }));
  }
}
