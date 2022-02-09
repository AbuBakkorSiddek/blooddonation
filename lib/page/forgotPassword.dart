import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  final formkey = GlobalKey();

  final TextEditingController _editingPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
        autofocus: false,
        controller: _editingPasswordController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          _editingPasswordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "Enter Your Email",
            labelText: "Enter Your Email",
            prefixIcon: Icon(Icons.email_outlined),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))));



    final resetButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(onPressed: () {  },
        minWidth: MediaQuery.of(context).size.width,
        child: Text('RESET PASSWORD',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

      ),
    );

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.red,size: 35,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "RESET PASSWORD",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,color: Colors.red),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  Text(
                      'We will mail you a link after when you provide email and click the send Button.Please click on that link to reset your Password... ',
                      style: TextStyle(fontSize: 25,color: Colors.red),textAlign: TextAlign.center,

                    ),

                  SizedBox(
                    height: 25,
                  ),

                  emailField,

                  SizedBox(
                    height: 25,
                  ),

                  resetButton

                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
