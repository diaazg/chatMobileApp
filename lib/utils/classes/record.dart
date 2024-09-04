import 'package:chat/utils/other/constants.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class Recorder {
  late final AudioRecorder audioRecorder;



  void init() {
    audioRecorder = AudioRecorder();
  }

  void dispose() {
    audioRecorder.dispose();
  }

  Future<void> startRecording() async {
    try {
      debugPrint(
          '=========>>>>>>>>>>> RECORDING!!!!!!!!!!!!!!! <<<<<<===========');

      String filePath = await getExternalStorageDirectory()
          .then((value) => '${value!.path}/${generateRandomId()}.wav');

      await audioRecorder.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
        ),
        path: filePath,
      );
    } catch (e) {
      debugPrint('ERROR WHILE RECORDING: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecorder.stop();
      debugPrint('=========>>>>>> PATH: $path <<<<<<===========');
    } catch (e) {
      debugPrint('ERROR WHILE STOP RECORDING: $e');
    }
  }

}
