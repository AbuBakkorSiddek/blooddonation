import 'package:blooddonation/model/user_model.dart';
import 'package:blooddonation/page/DashBoard.dart';
import 'package:blooddonation/page/login.dart';
import 'package:blooddonation/page/varify.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {




  void sendOTP()async{

    EmailAuth.sessionName = "Company Name";
    bool result = await EmailAuth.sendOtp(receiverMail: email.value.text);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }


  void verify() {
    EmailAuth.validate(
        receiverMail: email.value.text,
        userOTP: OtpController.value.text);
  }


  final formkey = GlobalKey<FormState>();



  //Auth

  final _Auth = FirebaseAuth.instance;

  //Gender Button
  int _value=0;

  //Blood Button

  int _val=0;

//togolButton;
  bool passhide = true;

  bool confHide = true;

  final TextEditingController fullName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController conformPassword = TextEditingController();
  final TextEditingController OtpController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
        onPressed: () {
          verify();
          signup(email.text, password.text);
        },
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          'SIGN UP',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 130),
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //fullName

                          TextFormField(
                              autofocus: false,
                              controller: fullName,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                RegExp regExp = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Please Enter Your Full Name");
                                }
                                if (!regExp.hasMatch(value)) {
                                  return ("Please Enter Name Min.6 Character");
                                }
                              },

                              onSaved: (value) {
                                fullName.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  hintText: "Enter Your Name",
                                  labelText: "Full Name",
                                  prefixIcon: Icon(Icons.account_box_outlined),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),

                          SizedBox(
                            height: 20,
                          ),

                          //userName
                          TextFormField(
                              autofocus: false,
                              controller: userName,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                RegExp regExp = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Please Enter Your User Name");
                                }
                                if (!regExp.hasMatch(value)) {
                                  return ("Please Enter Name Min.6 Character");
                                }
                              },
                              onSaved: (value) {
                                fullName.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  hintText: "User Name",
                                  labelText: "User Name",
                                  prefixIcon: Icon(Icons.account_circle),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),



                          SizedBox(
                            height: 20,
                          ),

                          //Gender

                          Padding(
                              padding: const EdgeInsets.only(right: 130),
                              child: Text(
                                'Choose Your Gender',
                                style: TextStyle(color: Colors.red, fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                            ),

                          SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [

                              Radio(value: 1, groupValue: _value, onChanged: (int?value){
                                setState(() {
                                  _value=value!;
                                });
                              }),
                              Text('Male'),


                              Radio(value: 2, groupValue: _value, onChanged: (int?value){
                                setState(() {
                                  _value=value!;
                                });
                              }),
                              Text('Female'),


                              Radio(value: 3, groupValue: _value, onChanged: (int?value){
                                setState(() {
                                  _value=value!;
                                });
                              }),
                              Text('Other'),

                            ],
                          ),


                          SizedBox(
                            height: 20,
                          ),

                          //Blood Group

                          Padding(
                            padding: const EdgeInsets.only(right: 130),
                            child: Text(
                              'Choose Blood Group',
                              style: TextStyle(color: Colors.red, fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ),

                          Column(
                            children: [


                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Radio(value: 1, groupValue: _val, onChanged: (int?value){
                                    setState(() {
                                      _val=value!;
                                    });
                                  }),
                                  Text('A+'),
                                ],
                              ),




                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Radio(value: 2, groupValue: _val, onChanged: (int?value){
                                    setState(() {
                                      _val=value!;
                                    });
                                  }),
                                  Text('A-  '),
                                ],
                              ),




                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Radio(value: 3, groupValue: _val, onChanged: (int?value){
                                    setState(() {
                                      _val=value!;
                                    });
                                  }),
                                  Text('B+'),
                                ],
                              ),




                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Radio(value: 4, groupValue: _val, onChanged: (int?value){
                                    setState(() {
                                      _val=value!;
                                    });
                                  }),
                                  Text('B-'),
                                ],
                              ),




                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Radio(value: 5, groupValue: _val, onChanged: (int?value){
                                    setState(() {
                                      _val=value!;
                                    });
                                  }),
                                  Text('AB+'),
                                ],
                              ),




                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Radio(value: 6, groupValue: _val, onChanged: (int?value){
                                    setState(() {
                                      _val=value!;
                                    });
                                  }),
                                  Text('AB-'),
                                ],
                              ),



                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Radio(value: 7, groupValue: _val, onChanged: (int?value){
                                    setState(() {
                                      _val=value!;
                                    });
                                  }),
                                  Text('O+'),
                                ],
                              ),




                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Radio(value: 8, groupValue: _val, onChanged: (int?value){
                                    setState(() {
                                      _val=value!;
                                    });
                                  }),
                                  Text('O-'),
                                ],
                              ),




                            ],
                          ),


                          SizedBox(
                            height: 10,
                          ),



                          SizedBox(
                            height: 20,
                          ),

                          //password
                          TextFormField(
                            autofocus: false,
                            controller: password,
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
                              password.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(Icons.lock_clock_outlined),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passhide = !passhide;
                                    });
                                  },
                                  icon: passhide
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          //conformPassword
                          TextFormField(
                            autofocus: false,
                            controller: conformPassword,
                            obscureText: true,
                            validator: (value) {

                              if (conformPassword.text!= password.text) {
                                return ("Password don't match");
                              }
                              return null;

                            },
                            onSaved: (value) {
                              conformPassword.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Conform Password",
                              labelText: "Conform Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(Icons.lock_clock_outlined),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      confHide = !confHide;
                                    });
                                  },
                                  icon: confHide
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                            ),
                          ),


                          SizedBox(
                            height: 20,
                          ),



                          //email


                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                    child: TextFormField(
                                          autofocus: false,
                                          controller: email,
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
                                            fullName.text = value!;
                                          },
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              prefixIcon: Icon(Icons.email_outlined),
                                              suffix: TextButton(
                                                child: Text('SEND OTP',style: TextStyle(color: Colors.red),) ,
                                                onPressed: ()=>sendOTP(),
                                              ),
                                              )),

                                 ),

                                ],
                              ),

                          SizedBox(
                            height: 20,
                          ),

                     //OTP


                          TextFormField(
                            autofocus: false,
                            controller:OtpController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your OPT");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              password.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Please Enter Your OPT",
                              labelText: "OTP",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(Icons.verified_user_outlined),
                              contentPadding:
                              EdgeInsets.fromLTRB(20, 15, 20, 15),
                            ),
                          ),


                          SizedBox(
                            height: 20,
                          ),

                          signUpButton,

                          SizedBox(
                            height: 10,
                          ),

                          Row(
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
                                          builder: (context) => Login()));
                                },
                                child: Text(' SIGN IN',
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void signup(String email,String password)async{




    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Varify()),
            (route) => false);

    //
    // if(formkey.currentState!.validate()){
    //
    //   await _Auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>
    //
    //       {
    //
    //         postDetailsFireStore()
    //
    //       }).catchError((e){
    //         Fluttertoast.showToast(msg: e!.Massage);
    //   });
    //
    // }

  }

//   postDetailsFireStore()async{
//
//     FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
//
//     User?user =_Auth.currentUser;
//
//
//     UserModel userModel=UserModel();
//
//     userModel.fullName=fullName.text;
//     userModel.userName=userName.text;
//     userModel.email=user!.email;
//     userModel.phone=phone.text;
//     userModel.uid=user!.uid;
//
//     await firebaseFirestore.collection('user').doc(user.uid).set(userModel.toMap());
//
//     Fluttertoast.showToast(msg: 'Account Create Successfully');
//
//
//     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Varify()),
//             (route) => false);
//
// }


}
