import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/utils/api/api_service.dart';
import 'package:chat/utils/api/end_points.dart';
import 'package:chat/utils/error/error_handler.dart';
import 'package:chat/utils/other/extensions.dart';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class MessageRemote {
  final ApiService apiService;

  MessageRemote({required this.apiService});

  Future<Map<String,dynamic>> getMessages(int sid, int rid) async {
    Map<String, int> data = {'sender_id': sid, 'receiver_id': rid};

    var response = await apiService.get(endPoint: 'message', data: data);

    List<MessageModel> messages = (response['messages'] as List)
        .map((message) => MessageModel.fromJson(message))
        .toList();

    DateTime lastConnection = DateTime.parse(response['user_state']);   
    

    return {
      'messages':messages,
      'state':lastConnection
    };
  }

  Future<List<MessageModel>> getNewMessages(
      int sid, int rid, DateTime minDateTime) async {
    String formattedDate = minDateTime.formattedDate();
    Map<String, dynamic> data = {
      'sender_id': sid,
      'receiver_id': rid,
      'min_date_time': formattedDate
    };

    var response = await apiService.get(endPoint: 'message', data: data);

    List<MessageModel> messages = (response['messages'] as List)
        .map((message) => MessageModel.fromJson(message))
        .toList();

    return messages;
  }

  Future<Uint8List?> getVoice(String audioName) async {
    try {
      Map<String, dynamic> data = {'audio': true, 'audio_file': audioName};

      Dio dio = Dio();
      var response = await dio.get(
        'http://$pcAdr:8000/basic/message',
        data: data,
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Serverfailure.fromResponse(response.statusCode!, response);
      }
    } on DioException catch (e) {
      throw Serverfailure.fromDioError(e);
    } catch (e) {
      throw Serverfailure("An unknown error occurred: ${e.toString()}");
    }
  }

  
}
