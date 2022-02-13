import 'package:blooddonation/model/user_model.dart';
import 'package:blooddonation/page/DashBoard.dart';
import 'package:blooddonation/wiget/CustomTextField.dart';
import 'package:blooddonation/wiget/register/registerSubText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = GlobalKey<FormState>();

  //Auth

  final _Auth = FirebaseAuth.instance;

  //Gender Button
  int _value = 0;

//togolButton;
  bool passhide = true;


  PasswordShowHide(){

    setState(() {
      passhide=true;
    });

  }


  bool confHide = true;


  ConfPasswordShowHide(){

    setState(() {
      confHide=true;
    });

  }

  final TextEditingController fullName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController conformPassword = TextEditingController();

  List<String> _blood = ['A+', 'A-', 'AB+', 'AB-', 'B+', 'B-', 'O+', 'O-'];

  String _text = "Nothing";

  final databaseRf = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.only(right: 140),
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          //fullName
                          CustomTextField(
                            autofocus: false,
                            controller: fullName,
                            hintText: 'Full Name',
                            labelText: 'Full Name',
                            prifixicon: Icon(Icons.account_box_outlined),
                            textInputAction: TextInputAction.next,
                            keyBoardType: TextInputType.name,
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
                          ),


                          SizedBox(
                            height: 20,
                          ),

                          //userName
                          CustomTextField(
                            autofocus:false,
                            controller: userName,
                            keyBoardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            hintText: 'User Name',
                            labelText: 'User Name',
                            prifixicon: Icon(Icons.account_circle),
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
                          ),


                          SizedBox(
                            height: 20,
                          ),

                          //email

                          CustomTextField(
                            autofocus: false,
                            controller: email,
                            hintText: 'email',
                            labelText: 'email',
                            prifixicon: Icon(Icons.email_outlined),
                            textInputAction: TextInputAction.next,
                            keyBoardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Email");
                              }
                              if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value))
                              {
                                return ("Please Enter a valid Email");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              email.text = value!;
                            },
                          ),


                          SizedBox(
                            height: 20,
                          ),

                          //phone

                          CustomTextField(
                              autofocus: false,
                              controller:phone,
                              keyBoardType: TextInputType.phone,
                              hintText: 'Phone',
                              labelText: 'Phone',
                              textInputAction: TextInputAction.next,
                              prifixicon: Icon(Icons.phone) ,
                              validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Phone");
                              }
                              if (value.length < 11) {
                                return ("Phone Number Should be 11");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              phone.text = value!;
                            },

                          ),


                          SizedBox(
                            height: 20,
                          ),

                          //Gender

                          Padding(
                            padding: const EdgeInsets.only(right: 130),
                            child: Text(
                              'Choose Your Gender',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          buildRadioButton(),

                          SizedBox(
                            height: 20,
                          ),

                          //Blood Group

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Blood Group',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Text(
                                _text,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),

                              SizedBox(
                                width: 50.0,
                              ),

                              DropdownButton(
                                  items: _blood
                                      .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                          )))
                                      .toList(),
                                  onChanged: (value) {
                                    _text = value.toString();

                                    print(value);

                                    setState(() {});
                                  })
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          //password
                          CustomTextField(
                            autofocus: false,
                            controller: password,
                            obscuretext: !passhide,
                            textInputAction: TextInputAction.next,
                            hintText: 'Password',
                            labelText: 'Password',
                            prifixicon: Icon(Icons.lock_clock_outlined),
                            sufixicon:IconButton(
                              onPressed: (){
                                PasswordShowHide();
                              },
                              icon:passhide?Icon(Icons.visibility):Icon(Icons.visibility_off),
                            ),


                          ),


                          SizedBox(
                            height: 20,
                          ),

                          //conformPassword




                          CustomTextField(
                              autofocus: false,
                              controller: conformPassword,
                              obscuretext:!confHide,
                              hintText: 'Conform Password',
                              labelText: 'Conform Password',
                            prifixicon: Icon(Icons.lock_clock_outlined),
                            sufixicon:IconButton(
                              onPressed: (){
                                ConfPasswordShowHide();
                              },
                              icon:confHide?Icon(Icons.visibility):Icon(Icons.visibility_off),
                            ),


                          ),


                          SizedBox(
                            height: 20,
                          ),

                          SingUpButton(context),

                          SizedBox(
                            height: 10,
                          ),

                          RowSubText(),
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

  Row buildRadioButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
            value: 1,
            groupValue: _value,
            onChanged: (int? value) {
              setState(() {
                _value = value!;
              });
            }),
        Text('Male'),
        Radio(
            value: 2,
            groupValue: _value,
            onChanged: (int? value) {
              setState(() {
                _value = value!;
              });
            }),
        Text('Female'),
        Radio(
            value: 3,
            groupValue: _value,
            onChanged: (int? value) {
              setState(() {
                _value = value!;
              });
            }),
        Text('Other'),
      ],
    );
  }

  Material SingUpButton(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
        onPressed: () {
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
  }

  void signup(String email, String password) async {
    if (formkey.currentState!.validate()) {
      await _Auth.createUserWithEmailAndPassword(
              email: email, password: password)
          .then((value) => { postDetailsFireStore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: "Error");
      });
    }
  }

  postDetailsFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _Auth.currentUser;

    UserModel userModel = UserModel();

    userModel.fullName = fullName.text;
    userModel.userName = userName.text;
    userModel.email = user!.email;
    userModel.phone = phone.text;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection('user')
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: 'Account Create Successfully');

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => DashBoard()), (route) => false);
  }

}


