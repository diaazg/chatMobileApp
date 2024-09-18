import 'package:chat/core/data/models/friend_model.dart';
import 'package:chat/core/data/models/invitation_model.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/utils/api/api_service.dart';

class FriendsRemote {
  final ApiService apiService;

  FriendsRemote({required this.apiService});

  Future<List<FriendModel>> getUserFriends(String uid) async {
    Map<String, dynamic> body = {"uid": uid, "friend": true};

    var friendsResponse = await apiService.get(endPoint: 'friend', data: body);

    List<FriendModel> friends = (friendsResponse['list'] as List)
        .map((friend) => FriendModel.fromJsonContact(friend))
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

  Future<List<InvitationModel>> getInvitations(int uid) async {
    Map<String, int> body = {"uid": uid};

    var invitationsResponse =
        await apiService.get(endPoint: 'invitation', data: body);


    List<InvitationModel> invitations =
        (invitationsResponse['invitations'] as List)
            .map((invitation) => InvitationModel.fromJson(invitation))
            .toList();
         

    return invitations;
  }

  Future<void> sendInvittation(int uid,int rid)async{
    
    Map<String,int> body = {"sender":uid,"receiver":rid};
     
    await apiService.post(endPoint: 'invitation', data: body);    
    
    

  }
  
  Future<void> acceptInvitation(int uid,int sid)async{

    Map<String,int> body = {"sender":sid,"receiver":uid};

    await apiService.put(endPoint: 'invitation', data: body);

  }

}
