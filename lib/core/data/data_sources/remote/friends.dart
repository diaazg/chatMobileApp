
import 'package:chat/core/data/models/friend_model.dart';
import 'package:chat/utils/api/api_service.dart';

class FriendsRemote {
  final ApiService apiService;

  FriendsRemote({required this.apiService});

  Future<List<FriendModel>> getUserFriends(String uid) async {
    Map<String, String> body = {"uid":uid};

    var friendsResponse = await apiService.get(endPoint: 'friend', data: body);

    List<FriendModel> friends = (friendsResponse['friends'] as List)
        .map((friend) => FriendModel.fromJson(friend))
        .toList();

    return friends;
  }
  

  


}
