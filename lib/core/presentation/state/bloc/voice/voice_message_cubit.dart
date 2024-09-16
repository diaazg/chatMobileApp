import 'package:chat/core/data/repo_imp/messages_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/voice/voice_message_state.dart';
import 'package:chat/utils/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';

class VoiceMessageCubit extends Cubit<VoiceMessageState> {
  VoiceMessageCubit() : super(VoiceStateInit());

  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  final MessagesRepoImp _messagesRepoImp = getIt<MessagesRepoImp>();

  bool isClicked = false;

  void getVoice(String audioName) async {
    emit(VoiceStateLoading());

    var response = await _messagesRepoImp.getVoice(audioName);
    response.fold((failure) {
      emit(VoiceStateFailure());
    }, (success) async {
      isClicked = true;
      emit(VoiceStateSuccess());
      await _player.openPlayer();
      await _player.startPlayer(
        fromDataBuffer: success,
      );
    });
  }

  void click(String audioName) {
    if (!isClicked) {
      getVoice(audioName);
    } else {
      isClicked = false;
      _player.stopPlayer();
      emit(VoiceStateInit());
    }
  }
}
