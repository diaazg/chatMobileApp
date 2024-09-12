import 'package:chat/core/data/data_sources/remote/friends.dart';
import 'package:chat/core/data/models/friend_model.dart';
import 'package:chat/core/data/models/invitation_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/domain/repo_abs/friend_repo_abs.dart';
import 'package:chat/utils/error/error_handler.dart';
import 'package:dartz/dartz.dart';

class FriendsRepoImp extends FriendRepoAbs {
  final FriendsRemote friendsRemote;

  FriendsRepoImp({required this.friendsRemote});

  @override
  Future<Either<Failure, List<FriendModel>>> getUserFriends(String uid) async {
    try {
      List<FriendModel> friends = await friendsRemote.getUserFriends(uid);

      return right(friends);
    } catch (e) {
      if (e is Serverfailure) {
        return left(e);
      } else {
        return left(Serverfailure("Failed: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getPeoples(String uid) async {
    try {
      List<UserModel> peoples = await friendsRemote.getPeoples(uid);

      return right(peoples);
    } catch (e) {
      if (e is Serverfailure) {
        return left(e);
      } else {
        return left(Serverfailure("Failed: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, String>> sendInvittation(int uid, int rid) async {
    try {
      await friendsRemote.sendInvittation(uid, rid);
      return right("Success");
    } catch (e) {
      if (e is Serverfailure) {
        return left(e);
      } else {
        return left(Serverfailure("Failed: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, List<InvitationModel>>> getInvitations(int uid)async {
   
   try {
     List<InvitationModel> invitations = await friendsRemote.getInvitations(uid);
     return right(invitations);
   } catch (e) {
           if (e is Serverfailure) {
        return left(e);
      } else {
        return left(Serverfailure("Failed: ${e.toString()}"));
      }
   }


  }
}
