import 'package:chat/utils/socket/socket_class.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/core/presentation/state/bloc/chat/chat_state.dart';
import 'dart:convert';
import '../../../../../utils/api/end_points.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.userName, this.receiverName) : super(ChatStateInit()) {
    emit(ChatStateLoading());
    setSocket();
    streamSocket.getResponse.listen((message) {
      if (message == 'disconnect') {
        print('ddddddddddddddddddddddddddddddddddddddddddddd');
        emit(ChatStateCloseSocket());
      } else {
        print(message);
        messages.add(message);
        emit(ChatStateNewMessage());
      }
    });
  }

  final String userName;
  final String receiverName;
  final StreamSocket streamSocket = StreamSocket();
  late WebSocketChannel channel;
  List<MessageModel> messages = [];

  void setSocket() {
    String roomName = getRoomName();
    channel = WebSocketChannel.connect(
      Uri.parse('ws://$pcAdr:8000/ws/chat/$roomName/'),
    );

    connectAndListen();
  }

  String getRoomName() {
    String roomName = '${userName}_$receiverName';
    return roomName;
  }

  void connectAndListen() {
    channel.stream.listen((data) {
      // Assuming the server sends JSON strings, parse the JSON and add it to the stream
      var message = MessageModel.fromJson(jsonDecode(data));
      print('----------------------------------------');
      print(message);
      streamSocket.addResponse(message);
    }, onDone: () {
      streamSocket.addResponse('disconnect');
    }, onError: (error) {
      print('Socket error: $error');
      emit(ChatStateCloseSocket());
    });
  }

  void sendMessage(Map<String, dynamic> message,{String action = 'send'}) {
    message['action'] = action; // adding the action name
    // Serialize the message as JSON before sending it
    channel.sink.add(jsonEncode(message));
  }

  @override
  Future<void> close() {
    print('close');
    channel.sink.close();
    streamSocket.dispose();
    return super.close();
  }
}
