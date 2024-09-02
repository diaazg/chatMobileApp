import 'package:flutter/material.dart';

void showSnackBar(String err,Color color, context) {
  SnackBar snack =  SnackBar(
    content: Text(err),
    backgroundColor: color,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snack);
}
