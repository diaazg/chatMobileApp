import 'package:camera/camera.dart';

class Camera {
  late CameraController cameraController;
  late List<CameraDescription> _cameras;

  late final XFile imageFile ;

  void getCamerasList ()async{
    _cameras = await availableCameras();
  }

  void init(){
    cameraController = CameraController(_cameras[0], ResolutionPreset.max);
  }

  void takePicture() async {
  try {
    final XFile picture = await cameraController.takePicture();
    imageFile = picture;
   
  
  } catch (e) {
    print("Error taking picture: $e");
  }
}
  

  void dispose(){
    cameraController.dispose();
  }
  

}