import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Existing account? ',
        style: TextStyle(
            color: Colors.white60, fontSize: 15, fontFamily: "Poppins"),
        children: <TextSpan>[
          TextSpan(
              text: 'Log in',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: "Poppins")),
        ],
      ),
    );
  }
}
