import 'package:flutter/material.dart';

class CustomDivideLine extends StatelessWidget {
  const CustomDivideLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white60,
            thickness: 2,
            endIndent: 15,
          ),
        ),
         Text('OR',style: TextStyle(color: Colors.white),),
         Expanded(
          child: Divider(
            color: Colors.white60,
            thickness: 2,
            indent: 15,
          ),
        ),
       
       
    
      ],
    );
  }
}
