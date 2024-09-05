abstract class ChatState {}

class ChatStateInit extends ChatState {}

class ChatStateLoading extends ChatState {}

class ChatStateFailure extends ChatState {}

class ChatStateNewMessage extends ChatState {

}

class ChatStateLoadFailure extends ChatState {

}

class ChatStateLoadWait extends ChatState {}
