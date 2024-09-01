import 'package:chat/core/data/messages.dart';
import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/core/presentation/state/bloc/chat/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.userName) : super(ChatStateInit()) {
    fetchMessages();
  }

  final String userName;

  final List<MessageModel> mesages = [];

  void fetchMessages() {
    List<MessageModel> fetchedMessages = kmessages;
    mesages.addAll(fetchedMessages);
  }

  void sendMessage(String message) {
    mesages.add(MessageModel(
        id: 'st', isMe: true, content: message, time: DateTime.now()));

    emit(ChatStateSent());    
  }
}
