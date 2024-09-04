class FriendModel {
  final int friend;
  final DateTime acceptTime;
  final DateTime? lastConnection;

  FriendModel({required this.friend, required this.acceptTime,this.lastConnection});

  factory FriendModel.fromJson(Map<String, dynamic> json) => FriendModel(
      friend: json['friend'] as int,
      acceptTime: DateTime.parse(json['accept_time']),

  );

  Map<String, dynamic> toJson() => {
        'friend': friend,
        'acceptTime': acceptTime,
        'lastConnection': lastConnection,
  };
}