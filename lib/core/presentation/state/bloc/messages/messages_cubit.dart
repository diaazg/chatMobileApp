import 'package:chat/core/data/data_sources/local/shared_pref.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/data/repo_imp/friends_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/messages/messages_state.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesStateInit()) {
   
    getFriends();
  }

  late UserModel user;

  final FriendsRepoImp _friendsRepoImp = getIt<FriendsRepoImp>();

  @override
  Future<void> close() {
    return super.close();
  }

  final List<String> friendsMessages =
      List<String>.generate(7, (i) => 'Item ${i + 1}');

  final int friendsStories = 8;

  /// I made it as int until I get data, then I will convert it into real list

  void deleteChat(int index) {
    friendsMessages.removeAt(index);
    emit(MessagesStateElementRemoved());
  }

  void getFriends() async {
    user = await getUserInfoFromLocalStorage();
    
    emit(MessagesLoading());
    var response = await _friendsRepoImp.getUserFriends(user.uid.toString());
    response.fold((failure) {
      emit(MessagesFailure(error: failure.errorMessage));
    }, (success) {
      emit(MessagesSucess(friends: success));
    });
  }
}
