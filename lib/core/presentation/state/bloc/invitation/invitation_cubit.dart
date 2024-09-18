import 'package:chat/core/data/data_sources/local/local_auth.dart';
import 'package:chat/core/data/models/invitation_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/data/repo_imp/friends_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/invitation/invitation_state.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvitationCubit extends Cubit<InvitationState> {
  InvitationCubit() : super(InvitationStateInit());

  List<InvitationModel> invitations = [];
  final FriendsRepoImp _friendsRepoImp = getIt<FriendsRepoImp>();

  void getInvitations() async {
    emit(InvitationStateLoading());
    UserModel userModel = await getUserInfoFromLocalStorage();
    var response = await _friendsRepoImp.getInvitations(userModel.uid!);
    response.fold((failure) {
      emit(InvitationStateGetFailure());
    }, (success) {
      invitations = success;
      emit(InvitationStateGetSuccess());
    });
  }

  void sendInvittation(int uid, int rid) async {
    emit(InvitationStateLoading());
    var response = await _friendsRepoImp.sendInvittation(uid, rid);
    response.fold((failure) {
      emit(InvitationStateSendFailure());
    }, (success) {
      emit(InvitationStateSendSuccess(id: rid));
    });
  }

  void acceptInvitation(int sid) async {
    UserModel userModel = await getUserInfoFromLocalStorage();
    var response = await _friendsRepoImp.acceptInvitation(userModel.uid!, sid);
    response.fold((failure) {
      emit(InvitationAcceptFailure(error: failure.errorMessage));
    }, (success) {
      invitations.removeWhere((element) => element.sid == sid);
      emit(InvitationAcceptSuccess());
    });
  }
}
