import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/utils/api/api_service.dart';
import 'package:chat/utils/other/extensions.dart';

class MessageRemote {
  final ApiService apiService;

  MessageRemote({required this.apiService});

  Future<List<MessageModel>> getMessages(int sid, int rid) async {
    Map<String, int> data = {'sender_id': sid, 'receiver_id': rid};

    var response = await apiService.get(endPoint: 'message', data: data);

    List<MessageModel> messages = (response['messages'] as List)
        .map((message) => MessageModel.fromJson(message))
        .toList();
    

    return messages;
  }
  
  Future<List<MessageModel>> getNewMessages(int sid, int rid,DateTime minDateTime)async{
    String formattedDate = minDateTime.formattedDate();
    Map<String, dynamic> data = {
      'sender_id': sid,
      'receiver_id': rid,
      'min_date_time':formattedDate
      };
      

    var response = await apiService.get(endPoint: 'message', data: data);
    
    
    List<MessageModel> messages = (response['messages'] as List)
        .map((message) => MessageModel.fromJson(message))
        .toList();
    

    return messages;


  }
  

}
