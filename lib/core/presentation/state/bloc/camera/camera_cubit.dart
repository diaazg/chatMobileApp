import 'package:camera/camera.dart';
import 'package:chat/core/presentation/state/bloc/camera/camera_state.dart';
import 'package:chat/core/presentation/state/classes/camera.dart';
import 'package:chat/core/presentation/state/classes/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraStateInit()) {
    initialize();
  }

  final cameraObject = getIt<Camera>();

  void initialize() async {
    try {
      cameraObject.init();
      await cameraObject.cameraController.initialize();
      emit(CameraStateInit());
    } catch (e) {
      if (e is CameraException) {
        if (e.code == 'CameraAccessDenied') {
          emit(CameraStateError('Camera access denied'));
        } else {
          emit(CameraStateError('An error occurred: ${e.description}'));
        }
      } else {
        emit(CameraStateError('An unknown error occurred'));
      }
    }
  }
  
  void takePicture(){
    cameraObject.takePicture();
  }

  @override
  Future<void> close() {
    cameraObject.dispose();
    return super.close();
  }
}
