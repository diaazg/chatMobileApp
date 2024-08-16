 import 'package:flutter/material.dart';

GestureDetector navigateBack(BuildContext context) {
    return GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back,color: Colors.black,)
              ],
            ),
          );
  }