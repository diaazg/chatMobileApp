import 'package:chat/core/presentation/state/classes/camera.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<Camera>(Camera());
}