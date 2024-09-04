import 'package:chat/core/data/models/friend_model.dart';

abstract class MessagesState {}

class MessagesStateInit extends MessagesState {}

class MessagesStateElementRemoved extends MessagesState {}


class MessagesLoading extends MessagesState {}


class MessagesFailure extends MessagesState {

  final String error;

  MessagesFailure({required this.error});

}


class MessagesSucess extends MessagesState {

  final List<FriendModel> friends ;

  MessagesSucess({required this.friends});

}
