import 'package:camera/camera.dart';
import 'package:chat/core/presentation/state/bloc/camera_bloc.dart/camera_cubit.dart';
import 'package:chat/core/presentation/state/bloc/camera_bloc.dart/camera_state.dart';
import 'package:chat/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraPreviewScreen extends StatelessWidget {
  const CameraPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocProvider(
        create: (context) => CameraCubit(),
        child: BlocBuilder<CameraCubit,CameraState>(
          builder: (context,state){
          final cubit = context.read<CameraCubit>();
          return Stack(
          children: <Widget>[
            CameraPreview(
                cubit.cameraObject.cameraController),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    cubit.cameraObject.takePicture();
                    Navigator.pushNamed(
                      context,
                      '/imagePreview',
                      arguments: {
                        'imageFile':
                            cubit.cameraObject.imageFile
                      },
                    );
                  },
                  backgroundColor: Colors.white,
                  foregroundColor: greenColors['mainGreen'],
                  child: const Icon(Icons.camera),
                ),
              ),
            ),
          ],
        );
     
        })
      )),
    );
  }
}
