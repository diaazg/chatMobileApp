import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatefulWidget {
 
  const ImageViewPage({super.key});

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
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