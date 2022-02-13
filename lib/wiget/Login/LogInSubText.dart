import 'package:blooddonation/page/register.dart';
import 'package:blooddonation/wiget/NavigatorContext.dart';
import 'package:flutter/material.dart';


class RowSubText extends StatelessWidget {
  const RowSubText ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 18),
        ),
        GestureDetector(
          onTap: () {
            navogatorPage(context, Signup());
          },
          child: Text(' SIGN UP',
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}