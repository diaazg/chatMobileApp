import 'package:chat/core/data/models/friend_model.dart';
import 'package:chat/utils/error/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class FriendRepoAbs {

  
  Future<Either<Failure,List<FriendModel>>> getUserFriends (String uid);


}