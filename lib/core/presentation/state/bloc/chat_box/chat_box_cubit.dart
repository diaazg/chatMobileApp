import 'package:chat/core/presentation/state/bloc/chat_box/chat_box_state.dart';
import 'package:chat/utils/classes/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert'; // For base64 encoding
import 'dart:io'; // For file handling

class ChatBoxCubit extends Cubit<ChatBoxState> {
  ChatBoxCubit() : super(ChatBoxStateInit()) {
    _controller.addListener(updateMessageState);
    _recorder.init();
  }

  final TextEditingController _controller = TextEditingController();
  final Recorder _recorder = Recorder();
  bool _isRecording = false;
  bool _messageEmpty = true;

  void updateMessageState() {
    if (_controller.text.isNotEmpty) {
      _messageEmpty = false;
    } else {
      _messageEmpty = true;
    }
    emit(ChatBoxStateMessageState());
  }

  void record() async {
    if (_isRecording == false) {
      final status = await Permission.microphone.request();

      if (status == PermissionStatus.granted) {
        _isRecording = true;
        emit(ChatBoxStateStartRecord());
        await _recorder.startRecording();
      } else if (status == PermissionStatus.permanentlyDenied) {
        debugPrint('Permission permanently denied');
      }
    } else {
      String? path = await _recorder.stopRecording();
      String base64Audio = '';
      if (path != null) {
        // Convert the recorded audio file to Base64
        File audioFile = File(path);
        List<int> audioBytes = await audioFile.readAsBytes();
        base64Audio = base64Encode(audioBytes);
      }

      _isRecording = false;
      emit(ChatBoxStateStopRecord(audioFile: base64Audio));
    }
  }

  void clearInput() {
    _controller.clear();
    emit(ChatBoxStateInit());
  }

  bool get isRecording => _isRecording;
  bool get messageEmpty => _messageEmpty;
  TextEditingController get controller => _controller;

  @override
  Future<void> close() {
    _controller.dispose();
    _recorder.dispose();
    return super.close();
  }
}
