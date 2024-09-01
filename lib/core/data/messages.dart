import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/utils/strings.dart';

List<MessageModel> kmessages = [
      MessageModel(id: '1', isMe: false, content: 'Hey', time: DateTime.now()),
      MessageModel(
          id: '2', isMe: true, content: Strings.longText, time: DateTime.now()),
      MessageModel(
          id: '3', isMe: true, content: 'How are u', time: DateTime.now()),
      MessageModel(id: '4', isMe: false, content: 'fine', time: DateTime.now()),
      MessageModel(id: '5', isMe: false, content: 'wbu?', time: DateTime.now()),
      MessageModel(
          id: '6',
          isMe: false,
          content: 'Are you still angery ??',
          time: DateTime.now()),
      MessageModel(
          id: '7', isMe: true, content: 'No, I\'m not', time: DateTime.now()),
      MessageModel(
          id: '8', isMe: false, content: Strings.longText, time: DateTime.now())
    ];