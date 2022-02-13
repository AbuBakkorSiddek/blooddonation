import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class Varify extends StatelessWidget {
   Varify({Key? key}) : super(key: key);

   final formkey = GlobalKey<FormState>();

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key:formkey ,
            child: Column(
              children: [
                TextFormField(
                    autofocus: false,
                    controller: otpController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your OTP");
                      }

                      return null;
                    },
                    onSaved: (value) {
                      otpController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "OTP",
                        labelText: "OTP",
                        prefixIcon: Icon(Icons.phone),
                        contentPadding:
                        EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ],
            ),
          )
        )



      ),

    );
  }
}
