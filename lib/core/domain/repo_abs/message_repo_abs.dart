import 'dart:typed_data';

import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/utils/error/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class MessageRepoAbs {


  Future<Either<Failure,Map<String,dynamic>>> getMessages(int sid,int rid);

  Future<Either<Failure,List<MessageModel>>> getNewMessages(int sid,int rid,DateTime minDateTime);

  Future<Either<Failure,Uint8List?>> getVoice(String audioName);


}