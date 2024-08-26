abstract class CameraState {}

class CameraStateInit extends CameraState {}

class CameraStateError extends CameraState {
  final String err;

  CameraStateError(this.err);
}

