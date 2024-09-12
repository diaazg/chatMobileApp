import 'package:chat/core/data/models/invitation_model.dart';
import 'package:chat/core/data/repo_imp/friends_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/invitation/invitation_state.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvitationCubit  extends Cubit<InvitationState> {
  InvitationCubit():super(InvitationStateInit());

  final List<InvitationModel> invitations = [];
  final FriendsRepoImp _friendsRepoImp = getIt<FriendsRepoImp>();

  
  void getInvitations(int uid , int rid)async{
    emit(InvitationStateLoading());
    var response = await _friendsRepoImp.getInvitations(uid);
    response.fold((failure){
        emit(InvitationStateGetFailure());
    }, (success){
       emit(InvitationStateGetSuccess());
    });

  }
  
  void sendInvittation(int uid,int rid)async{
    
      emit(InvitationStateLoading());
      var response = await _friendsRepoImp.sendInvittation(uid, rid);
      response.fold((failure){
        emit(InvitationStateSendSuccess());
      }, (success){
        emit(InvitationStateGetSuccess());
      });

   
  }



}