class FriendModel {
  final int friendID;
  final String? friendName;
  final DateTime? acceptTime;
  final DateTime? lastConnection;
  final String? state;
  final String? phoneNbr;
  

  FriendModel(
      {this.friendName,
      required this.friendID,
      this.acceptTime,
      this.lastConnection,
      this.state,
      this.phoneNbr});

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
        friendID: json['friend_id'] as int,
        friendName: json['friend_name'] as String,
        acceptTime: DateTime.parse(json['accept_time']),
      );

  factory FriendModel.fromJsonContact(Map<String, dynamic> json){
   
    Duration difference = DateTime.now().difference(DateTime.parse(json['last_connected']));
    String? state;
   
    if (difference.inHours >= 1 && difference.inHours < 23) {
      state =  "${difference.inHours} h ago";
    } else if (difference.inHours > 23) {
      state = "looong time";
    } else if (difference.inMinutes < 5) {
      state = "Active";
    } else {
     state = "${difference.inMinutes} min ago";
    }
   

    return FriendModel(
      friendID: json['friend_id'] as int,
      friendName: json['friend_name'] as String,
      phoneNbr: json['phone_nbr'] as String,
      state: state
      
      );

  }


      

  Map<String, dynamic> toJson() => {
        'friend': friendID,
        'acceptTime': acceptTime,
        'lastConnection': lastConnection,
      };
}
