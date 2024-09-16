abstract class ChatBoxState {}

class ChatBoxStateInit extends ChatBoxState {}

class ChatBoxStateMessageState extends ChatBoxState {}

class ChatBoxStateRecordState extends ChatBoxState {}

class ChatBoxStateStartRecord extends ChatBoxState {}

class ChatBoxStateStopRecord extends ChatBoxState {
 final String? audioFile;

  ChatBoxStateStopRecord({required this.audioFile});
}