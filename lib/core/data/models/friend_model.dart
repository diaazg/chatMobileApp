class FriendModel {
  final int friendID;
  final String? friendName;
  final DateTime acceptTime;
  final DateTime? lastConnection;

  FriendModel( {this.friendName,required this.friendID, required this.acceptTime,this.lastConnection});

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
      friendID: json['friend_id'] as int,
      friendName: json['friend_name'] as String,
      acceptTime: DateTime.parse(json['accept_time']),

  );

  Map<String, dynamic> toJson() => {
        'friend': friendID,
        'acceptTime': acceptTime,
        'lastConnection': lastConnection,
  };
}