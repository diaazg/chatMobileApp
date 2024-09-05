import 'package:chat/core/data/repo_imp/messages_repo_imp.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:chat/utils/socket/socket_class.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/core/presentation/state/bloc/chat/chat_state.dart';
import 'dart:convert';
import '../../../../../utils/api/end_points.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.uid, this.rid) : super(ChatStateInit()) {
    emit(ChatStateLoading());
    init();
  }

  final int uid;
  final int rid;
  final StreamSocket streamSocket = StreamSocket();
  final MessagesRepoImp _messagesRepoImp = getIt<MessagesRepoImp>();
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
    String roomName = '${uid}_$rid';
    return roomName;
  }

  void connectAndListen() {
    channel.stream.listen((data) {
      // Assuming the server sends JSON strings, parse the JSON and add it to the stream
      var message = MessageModel.fromJson(jsonDecode(data));
      streamSocket.addResponse(message);
    }, onDone: () {
      streamSocket.addResponse('disconnect');
    }, onError: (error) {
      emit(ChatStateFailure());
    });
  }

  void sendMessage(Map<String, dynamic> message, {String action = 'send'}) {
    message['action'] = action; // adding the action name
    // Serialize the message as JSON before sending it
    channel.sink.add(jsonEncode(message));
  }

  void init() async {
    var getMessages = await _messagesRepoImp.getMessages(uid, rid);

    getMessages.fold((failure) {
      print(failure.errorMessage);
      emit(ChatStateFailure());
    }, (success) {
      messages = success.reversed.toList();
      emit(ChatStateNewMessage());
      setSocket();
      streamSocket.getResponse.listen((message) {
        if (message == 'disconnect') {
          emit(ChatStateFailure());
        } else {
          messages.add(message);
          emit(ChatStateNewMessage());
        }
      });
    });
  }

  @override
  Future<void> close() {
    channel.sink.close();
    streamSocket.dispose();
    return super.close();
  }
}
