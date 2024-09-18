class FriendModel {
  final int friendID;
  final String? friendName;
  final DateTime? acceptTime;
  final DateTime? lastConnection;
  final String? phoneNbr;

  FriendModel(
      {this.friendName,
      required this.friendID,
      this.acceptTime,
      this.lastConnection,
      this.phoneNbr});

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
        friendID: json['friend_id'] as int,
        friendName: json['friend_name'] as String,
        acceptTime: DateTime.parse(json['accept_time']),
      );

  factory FriendModel.fromJsonContact(Map<String, dynamic> json) => FriendModel(
      friendID: json['friend_id'] as int,
      friendName: json['friend_name'] as String,
      phoneNbr: json['phone_nbr'] as String
      
      );

  Map<String, dynamic> toJson() => {
        'friend': friendID,
        'acceptTime': acceptTime,
        'lastConnection': lastConnection,
      };
}
