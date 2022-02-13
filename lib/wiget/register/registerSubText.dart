import 'package:blooddonation/page/DashBoard.dart';
import 'package:flutter/material.dart';

class RowSubText extends StatelessWidget {
  const RowSubText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(fontSize: 18),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DashBoard()));
          },
          child: Text(' SIGN IN',
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}