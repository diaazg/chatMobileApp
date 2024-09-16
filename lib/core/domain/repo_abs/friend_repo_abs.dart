import 'package:chat/core/data/models/friend_model.dart';
import 'package:chat/core/data/models/invitation_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/utils/error/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class FriendRepoAbs {

  
  Future<Either<Failure,List<FriendModel>>> getUserFriends (String uid);
  Future<Either<Failure,List<UserModel>>> getPeoples(String uid);
  Future<Either<Failure,String>> sendInvittation(int uid,int rid);
  Future<Either<Failure,List<InvitationModel>>> getInvitations(int uid);
  Future<Either<Failure,String>> acceptInvitation(int uid,int rid);


}