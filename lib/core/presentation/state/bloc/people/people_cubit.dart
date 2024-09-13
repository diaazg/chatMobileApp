import 'package:chat/core/data/data_sources/local/shared_pref.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/data/repo_imp/friends_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/people/people_state.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeopleCubit extends Cubit<PeopleState> {
  PeopleCubit() : super(PeopleStateInit()) {
    getPeoples();
  }

  final FriendsRepoImp _friendsRepoImp = getIt<FriendsRepoImp>();
  List<UserModel> peoples = [];

  void getPeoples() async {
    emit(PeopleStateLoading());
    UserModel user = await getUserInfoFromLocalStorage();
    int uid = user.uid!;

    var response = await _friendsRepoImp.getPeoples(uid.toString());
    response.fold((failure) {
      emit(PeopleStateFailure(err: failure.errorMessage));
    }, (success) {
      peoples = success;
      emit(PeopleStateSuccess());
    });
  }

  void removeEelement(int rid){
    peoples.removeWhere((item)=> item.uid == rid);
    emit(PeopleStateSuccess());
  }

}
