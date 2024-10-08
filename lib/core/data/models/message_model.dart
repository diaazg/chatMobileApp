class MessageModel {
  final String? type;
  final int? sender;
  final int receiver;
  final String? audioFile;
  final String? imageFile;
  final String? textContent;
  final int? id;
  final DateTime? dateTime;


  MessageModel(
      {required this.sender,
      required this.receiver,
      this.audioFile,
      this.imageFile,
      this.textContent,
      this.id,
      this.dateTime,
      this.type,

      });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        type: json['type'] as String ,
        sender: json['sender'] as int,
        receiver: json['receiver'] as int,
        audioFile: json['audio_file'],
        imageFile: json['image_file'],
        textContent: json['text_content'] ,
        id: json['message_id'] as int,
        dateTime: DateTime.parse(json['date_time']),
      );

  
  


  Map<String, dynamic> toJson() => {
        'sender_id': sender,
        'receiver_id': receiver,
        'message': textContent,
      };
}
