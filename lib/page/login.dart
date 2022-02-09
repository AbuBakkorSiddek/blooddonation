import 'package:blooddonation/page/DashBoard.dart';
import 'package:blooddonation/page/forgotPassword.dart';
import 'package:blooddonation/page/register.dart';
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
  final formkey = GlobalKey();

  final TextEditingController _editingEmailController = TextEditingController();
  final TextEditingController _editingPasswordController =
      TextEditingController();

  bool hide = true;

  //firebase Auth

 final _Auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final signInButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
        onPressed: () {},
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          'SIGN IN',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
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
                      TextFormField(
                          autofocus: false,
                          controller: _editingEmailController,
                          keyboardType: TextInputType.emailAddress,
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
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: "Email",
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      SizedBox(
                        height: 25,
                      ),

                      //Password
                      TextFormField(
                        autofocus: false,
                        controller: _editingPasswordController,
                        obscureText: true,
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
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.lock_clock_outlined),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hide = !hide;
                                });
                              },
                              icon: hide
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      signInButton,
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Text(' SIGN UP',
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Text('Forgot Password?',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )
                    ],
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
        Fluttertoast.showToast(msg: e!.massage);
      });
    }
  }
}
