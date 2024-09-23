import 'package:chat/core/data/repo_imp/messages_repo_imp.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:chat/utils/socket/socket_class.dart';
import 'package:flutter/widgets.dart';
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
  String activeState = "Inactive";
  final ScrollController scrollController = ScrollController();
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

  String updateState(DateTime lastConnection) {
    Duration difference = DateTime.now().difference(lastConnection);

    if (difference.inHours >= 1 && difference.inHours<23) {
      return "Active ${difference.inHours} h ago";
    } else if (difference.inHours > 23) {
      return "Active before looong time";
    } else if (difference.inMinutes < 5) {
      return "Active";
    } else {
      return "Active ${difference.inMinutes} min ago";
    }
  }

 

  void connectAndListen() {
    channel.stream.listen((data) {
      Map<String, dynamic> json = jsonDecode(data);

      if (json.keys.contains('action')) {
        String roomName = json['room_name'];
        emit(ChatStateVideoCall(roomID: roomName));
      } else {
        var message = MessageModel.fromJson(json);
        if (json.containsKey('user_state')) {
          int sid = message.sender ?? 0;

          if (sid == rid) {
            DateTime lastConnection = DateTime.parse(json['user_state']);
            activeState = updateState(lastConnection);
          }

          streamSocket.addResponse(message);
        }
      }
    }, onDone: () {
      streamSocket.addResponse('disconnect');
    }, onError: (error) {
      emit(ChatStateFailure());
    });
  }

  void sendMessage(Map<String, dynamic> message, String action) {
    message['action'] = action; // adding the action name
    // Serialize the message as JSON before sending it
    channel.sink.add(jsonEncode(message));
  }

  void init() async {
    var getMessages = await _messagesRepoImp.getMessages(uid, rid);

    getMessages.fold((failure) {
      emit(ChatStateFailure());
    }, (success) {
      
      List<MessageModel> successMessages =success['messages'].reversed.toList();
      messages = successMessages;
      
      scrollController.addListener(_onScroll);
      DateTime lastConnection = success['state'];
      activeState = updateState(lastConnection);

      emit(ChatStateNewMessage());
      setSocket();
      streamSocket.getResponse.listen((message) {
        if (message == 'disconnect') {
          scrollController.dispose();
          emit(ChatStateFailure());
        } else {
          messages.add(message);
          emit(ChatStateNewMessage());
        }
      });
    });
  }

  void _onScroll() {
    if (scrollController.position.pixels <=
            scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      _loadMoreMessages();
    }
  }

  Future<void> _loadMoreMessages() async {
    DateTime? minDateTime = messages.first.dateTime;
    if (minDateTime != null) {
      emit(ChatStateLoadWait());

      var getMessages =
          await _messagesRepoImp.getNewMessages(uid, rid, minDateTime);

      getMessages.fold((failure) {
        emit(ChatStateLoadFailure());
      }, (success) {
        messages.insertAll(0, success.reversed.toList());
        emit(ChatStateNewMessage());
      });
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    channel.sink.close();
    streamSocket.dispose();
    return super.close();
  }
}
