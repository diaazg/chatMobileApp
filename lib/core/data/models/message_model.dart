class MessageModel {
  final String sender;
  final String receiver;
  final String message;
  final int? id;
  final DateTime? dateTime;

  MessageModel({required this.sender, required this.receiver, required this.message,this.id,this.dateTime});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      sender: json['sender'] as String,
      receiver: json['receiver'] as String,
      message: json['message'] as String,
      id: json['message_id'] as int,
      dateTime: DateTime.parse(json['date_time']) ,
  );

  Map<String, dynamic> toJson() => {
        'sender_id': sender,
        'receiver_id': receiver,
        'message': message,
  };
}