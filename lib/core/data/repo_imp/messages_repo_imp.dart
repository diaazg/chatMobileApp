import 'package:chat/core/data/data_sources/remote/messages.dart';
import 'package:chat/core/data/models/message_model.dart';
import 'package:chat/core/domain/repo_abs/message_repo_abs.dart';
import 'package:chat/utils/error/error_handler.dart';
import 'package:dartz/dartz.dart';

class MessagesRepoImp implements MessageRepoAbs {
  final MessageRemote messageRemote;

  MessagesRepoImp({required this.messageRemote});

  @override
  Future<Either<Failure, List<MessageModel>>> getMessages(
      int sid, int rid) async {
    try {
      List<MessageModel> messages = await messageRemote.getMessages(sid, rid);

      return right(messages);
    } catch (e) {
      if (e is Serverfailure) {
        return left(e);
      } else {
        return left(Serverfailure("Failed: ${e.toString()}"));
      }
    }
  }
}
