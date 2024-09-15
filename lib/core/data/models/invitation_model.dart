class InvitationModel {
  final int sid;
  final String? username;
  final DateTime sendTime;

  InvitationModel({required this.sid, this.username, required this.sendTime});

  factory InvitationModel.fromJson(Map<String, dynamic> json) => InvitationModel(
      sid: json['sid'],
      sendTime: DateTime.parse(json['send_time']) ,
  );

  Map<String, dynamic> toJson() => {
        'sid': sid,
  };
}