import 'package:chat/core/data/models/friend_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/utils/api/api_service.dart';

class FriendsRemote {
  final ApiService apiService;

  FriendsRemote({required this.apiService});

  Future<List<FriendModel>> getUserFriends(String uid) async {
    Map<String, dynamic> body = {"uid": uid, "friend": true};

    var friendsResponse = await apiService.get(endPoint: 'friend', data: body);

    List<FriendModel> friends = (friendsResponse['list'] as List)
        .map((friend) => FriendModel.fromJson(friend))
        .toList();

    return friends;
  }

  Future<List<UserModel>> getPeoples(String uid) async {
    Map<String, dynamic> body = {"uid": uid, "friend": false};

    var peoplesResponse = await apiService.get(endPoint: 'friend', data: body);

    List<UserModel> peoples = (peoplesResponse['list'] as List)
        .map((user) => UserModel.getPeoples(user))
        .toList();
    return peoples;    
  }
}
