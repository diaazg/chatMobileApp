import 'package:camera/camera.dart';
import 'package:chat/core/presentation/state/classes/camera.dart';
import 'package:chat/core/presentation/state/classes/get_it.dart';
import 'package:chat/utils/colors.dart';
import 'package:flutter/material.dart';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({super.key});

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  final cameraObject = getIt<Camera>();
  @override
  void initState() {
    cameraObject.init();
    cameraObject.cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            // App bar configuration
            ),
        body: Stack(
          children: <Widget>[
            CameraPreview(cameraObject.cameraController),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    cameraObject.takePicture();
                    Navigator.pushNamed(
                      context,
                      '/imagePreview',
                      arguments: {'imageFile': cameraObject.imageFile},
                    );
                  },
                  backgroundColor: Colors.white,
                  foregroundColor: greenColors['mainGreen'],
                  child: const Icon(Icons.camera),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
