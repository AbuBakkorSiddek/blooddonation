import 'package:blooddonation/page/DashBoard.dart';
import 'package:blooddonation/wiget/CustomTextField.dart';
import 'package:blooddonation/wiget/Login/LogInSubText.dart';
import 'package:blooddonation/wiget/Login/loginTextButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController _editingEmailController = TextEditingController();
  final TextEditingController _editingPasswordController = TextEditingController();

//password Show Hide

  bool hide = false;

   PasswordShowHide(){

    setState(() {
      hide=true;
    });

  }

  //firebase Auth

  final _Auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(
                          height: 200,
                          child: Image.asset(
                            'images/bloodicon.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        SizedBox(
                          height: 35,
                        ),

                        //Email
                        CustomTextField(
                          controller:_editingEmailController,
                          autofocus: false,
                          hintText: 'Email',
                          labelText: 'Email',
                          keyBoardType: TextInputType.emailAddress,
                          prifixicon: Icon(Icons.email_outlined),
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid Email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editingEmailController.text = value!;
                          },

                        ),



                        SizedBox(
                          height: 25,
                        ),

                        //Password

                        CustomTextField(
                          autofocus: true,
                          obscuretext:!hide,
                          controller:_editingPasswordController,
                          hintText: 'Password',
                          labelText: 'Password',
                          textInputAction: TextInputAction.next,
                          prifixicon: Icon(Icons.lock_clock_outlined),
                          sufixicon:IconButton(
                            onPressed: (){
                              PasswordShowHide();
                            },
                            icon:hide?Icon(Icons.visibility):Icon(Icons.visibility_off),
                          ),

                          validator: (value) {
                            RegExp regExp = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Please Enter Your Password");
                            }
                            if (!regExp.hasMatch(value)) {
                              return ("Please Enter valid password(Min.6 Character)");
                            }
                          },
                          onSaved: (value) {
                            _editingPasswordController.text = value!;
                          },
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                          child: MaterialButton(
                            onPressed: () {
                              singIn(_editingEmailController.text, _editingPasswordController.text);
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              'SIGN IN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),


                        SizedBox(
                          height: 20,
                        ),

                        //  Already have an account?SignIn

                        RowSubText(),


                        SizedBox(
                          height: 5,
                        ),


                        LogInTextButton()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  //Login Function

  void singIn(String email, String password) async {
    if (formkey.currentState!.validate()) {
      await _Auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "SIGN IN SUCCESSFUL.."),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => DashBoard())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg:"Please Create account ");
      });
    }
  }
}






