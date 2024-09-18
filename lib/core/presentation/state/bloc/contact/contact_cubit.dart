import 'package:chat/core/data/data_sources/local/local_auth.dart';
import 'package:chat/core/data/models/friend_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/data/repo_imp/friends_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/contact/contact_state.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactStateInit()){
    getContacts();
  
  }

      @override
  Future<void> close() {

    return super.close();
  }
  
 
  final FriendsRepoImp _friendsRepoImp = getIt<FriendsRepoImp>();
  final List<FriendModel> _contacts = [];

  final List<String> _alphabet =
      List.generate(26, (index) => String.fromCharCode(index + 65));

  void getContacts() async{
        emit(ContactStateLoading());
        UserModel userModel = await getUserInfoFromLocalStorage();
    var response = await _friendsRepoImp.getUserFriends(userModel.uid.toString());
    response.fold((failure) {
      emit(ContactStateFailure(error: failure.errorMessage));
    }, (success) {
      _contacts.addAll(success);
      emit(ContactStateSuccess());
    });
    
  }

  List<FriendModel> get contacts => _contacts;
  List<String> get alphabet => _alphabet;
}
