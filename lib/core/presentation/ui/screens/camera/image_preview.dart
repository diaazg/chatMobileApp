import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageViewPage extends StatelessWidget {
 
   ImageViewPage({super.key});

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final XFile imageFile = args['imageFile'];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captured Image'),
      ),
      body: Center(
        child: Image.file(File(imageFile.path)),
      ),
    );
  }
}