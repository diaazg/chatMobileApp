import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageViewPage extends StatelessWidget {
  ImageViewPage({super.key, required this.imageFile});

  bool isLoading = false;
  final XFile imageFile;

  @override
  Widget build(BuildContext context) {
 
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Captured Image'),
      ),
      body: Column(
        children: [
          Image.file(File(imageFile.path)),
          TextButton(
              onPressed: () {},
              child: const Text(
                "send",
                style: TextStyle(
                    color: Colors.red, fontSize: 15, fontFamily: "Poppins"),
              ))
        ],
      ),
    );
  }
}
