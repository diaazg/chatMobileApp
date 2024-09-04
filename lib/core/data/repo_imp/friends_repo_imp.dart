import 'package:chat/core/data/data_sources/remote/friends.dart';
import 'package:chat/core/data/models/friend_model.dart';
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
}
