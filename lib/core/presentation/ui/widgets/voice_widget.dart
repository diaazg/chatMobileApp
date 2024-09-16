import 'package:chat/core/presentation/state/bloc/voice/voice_message_cubit.dart';
import 'package:chat/core/presentation/state/bloc/voice/voice_message_state.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class VoiceWidget extends StatelessWidget {
  const VoiceWidget({
    super.key,
    required this.isMe,
    required this.screenWidth,
    required this.height,
    required this.audioName
  });

  final bool isMe;
  final double screenWidth;
  final double height;
  final String audioName;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceMessageCubit(),
      child: BlocBuilder<VoiceMessageCubit,VoiceMessageState>(
        builder: (context,state) {
          final cubit = context.read<VoiceMessageCubit>();
          return GestureDetector(
            onTap: () {
             cubit.click(audioName);
            },
            child: Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    maxWidth: screenWidth * 0.5,
                    minWidth: screenWidth * 0.2,
                    minHeight: height,
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: isMe
                          ? greenColors[cubit.isClicked ? 'thirdGreen' : 'secondaryGreen']
                          : Colors.grey[cubit.isClicked ? 350 : 300],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(isMe ? 20 : 0),
                          bottomLeft: const Radius.circular(20),
                          bottomRight: const Radius.circular(20),
                          topRight: Radius.circular(isMe ? 0 : 20))),
                  child: Icon(cubit.isClicked?Icons.pause:Icons.play_arrow,
                      color: isMe ? Colors.white : Colors.black),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
