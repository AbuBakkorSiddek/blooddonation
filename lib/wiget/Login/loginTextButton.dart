import 'package:blooddonation/page/forgotPassword.dart';
import 'package:flutter/material.dart';

class LogInTextButton extends StatelessWidget {
  const LogInTextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ForgotPassword()));
      },
      child: Text('Forgot Password?',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}