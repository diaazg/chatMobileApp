import 'package:flutter/material.dart';

class CustomDivideLine extends StatelessWidget {
  const CustomDivideLine({
    super.key,
    required this.isWhite
  });

  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Divider(
            color: isWhite?Colors.white60:Colors.black26,
            thickness: 2,
            endIndent: 15,
          ),
        ),
         Text('OR',style: TextStyle(color: isWhite?Colors.white:Colors.black),),
         Expanded(
          child: Divider(
            color: isWhite?Colors.white60:Colors.black26,
            thickness: 2,
            indent: 15,
          ),
        ),
       
       
    
      ],
    );
  }
}
