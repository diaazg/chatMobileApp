import 'package:chat/core/presentation/state/bloc/messages/messages_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesCubit extends Cubit<MessagesState>{
  MessagesCubit():super(MessagesStateInit()){
    print("-------------------init messages cubit---------------");
  }

    @override
  Future<void> close() {
    print('--------------closed-----------------');
    return super.close();
  }
  
  String tryTitle = 'Home';

  final List<String> friendsMessages = List<String>.generate(7, (i) => 'Item ${i + 1}');

  final int friendsStories = 8 ; /// I made it as int until I get data, then I will convert it into real list


  void changeTitle(String newTitle){
     
     tryTitle = newTitle;
     emit(MessagesStateElementRemoved());


  }

 


  void deleteChat(int index){
     friendsMessages.removeAt(index);
     emit(MessagesStateElementRemoved());
  }

}