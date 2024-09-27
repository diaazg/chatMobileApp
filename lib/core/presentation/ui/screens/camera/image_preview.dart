import 'dart:io';
import 'package:camera/camera.dart';
import 'package:chat/core/presentation/state/bloc/chat/chat_cubit.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageViewPage extends StatelessWidget {
  ImageViewPage({super.key, required this.imageFile, required this.chatCubit});

  bool isLoading = false;
  final XFile imageFile;
  final ChatCubit chatCubit;

  Future<bool> _deleteImage() async {
    try {
      final file = File(imageFile.path);
      if (await file.exists()) {
        await file.delete(); 
      }
      return true; 
    } catch (e) {

      return true; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _deleteImage, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Captured Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.file(File(imageFile.path)),
            GestureDetector(
              onTap: () {
                chatCubit.sendImage(imageFile);
                for (int i=0;i<=1;i++){
                    Navigator.pop(context);
                }
                
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greenColors['mainGreen']),
                child: const Text(
                  "send",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
