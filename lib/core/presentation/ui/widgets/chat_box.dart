import 'package:chat/core/presentation/state/classes/record.dart';
import 'package:chat/core/presentation/ui/widgets/custom_record_wave_widget.dart';
import 'package:chat/utils/colors.dart';
import 'package:chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: must_be_immutable
class ChatBox extends StatefulWidget {
  const ChatBox({
    super.key,
    required this.sendFunction,
  });

  final Function(String message) sendFunction;

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _controller = TextEditingController();
  bool messageEmpty = true;
  bool isRecording = false;
  final Recorder _recorder = Recorder();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        if (_controller.text.isNotEmpty) {
          messageEmpty = false;
        } else {
          messageEmpty = true;
        }
      });
    });

    _recorder.init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _recorder.dispose();
  }

  void _record() async {
    if (isRecording == false) {
      final status = await Permission.microphone.request();

      if (status == PermissionStatus.granted) {
        setState(() {
          isRecording = true;
        });
        await _recorder.startRecording();
      } else if (status == PermissionStatus.permanentlyDenied) {
        debugPrint('Permission permanently denied');
      }
    } else {
      await _recorder.stopRecording();

      setState(() {
        isRecording = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: isRecording
                ? const CustomRecordingWaveWidget()
                : TextFormField(
                    controller: _controller,
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
        if (!messageEmpty)
          GestureDetector(
            onTap: () {
              widget.sendFunction(_controller.text);
              _controller.clear();
            },
            child: CircleAvatar(
              backgroundColor: greenColors['secondaryGreen'],
              radius: 40,
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        else
          Row(
            children: [
              const ImageIcon(
                AssetImage('$imagesPath/icons/camera.png'),
                size: 30,
              ),
              GestureDetector(
                onLongPressUp: _record,
                onLongPress: _record,
                child: const ImageIcon(
                  AssetImage('$imagesPath/icons/mic.png'),
                  size: 30,
                ),
              )
            ],
          )
      ],
    );
  }
}
