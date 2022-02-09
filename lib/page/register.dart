import 'package:blooddonation/page/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final formkey = GlobalKey();

//togolButton;
  bool passhide = true;

  bool confHide=true;

  final TextEditingController fullName=TextEditingController();
  final TextEditingController userName=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController gender=TextEditingController();
  final TextEditingController bloodGroup=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController conformPassword=TextEditingController();


  @override
  Widget build(BuildContext context) {

    //fullName

    final fullNameField = TextFormField(
        autofocus: false,
        controller: fullName,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          fullName.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "Enter Your Name",
            labelText: "Full Name",
            prefixIcon: Icon(Icons.account_box_outlined),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //userName
    final userNameField = TextFormField(
        autofocus: false,
        controller: userName,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          fullName.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "User Name",
            labelText: "User Name",
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //email
    final emailField = TextFormField(
        autofocus: false,
        controller: email,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          fullName.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "Email",
            labelText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //phone
    final phoneField = TextFormField(
        autofocus: false,
        controller: phone,
        keyboardType: TextInputType.number,
        onSaved: (value) {
          fullName.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "Phone",
            labelText: "Phone",
            prefixIcon: Icon(Icons.email_outlined),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //gender
    final genderField = TextFormField(
        autofocus: false,
        controller: gender,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          fullName.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "Gender",
            labelText: "Gender",
            prefixIcon: Icon(Icons.group_sharp),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //bloodGroup
    final bloodGroupField = TextFormField(
        autofocus: false,
        controller: bloodGroup,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          fullName.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "Blood Group",
            labelText: "Blood Group",
            prefixIcon: Icon(Icons.bloodtype_outlined),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //password
    final passwordField = TextFormField(
      autofocus: false,
      controller: password,
      obscureText: true,
      onSaved: (value) {
       password.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Password",
        labelText: "Password",
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.lock_clock_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passhide = !passhide;
              });
            },
            icon: passhide ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),

      ),
    );

    //conformPassword
    final conformPasswordField = TextFormField(
      autofocus: false,
      controller: conformPassword,
      obscureText: true,
      onSaved: (value) {
        conformPassword.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Conform Password",
        labelText: "Conform Password",
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.lock_clock_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                confHide = !confHide;
              });
            },
            icon: confHide ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),

      ),
    );


    final signUpButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(onPressed: () {  },
        minWidth: MediaQuery.of(context).size.width,
        child: Text('SIGN UP',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),

      ),
    );





    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.red,),
              onPressed: () { 
                Navigator.of(context).pop();
              },
            ),
          ),
          body:Center(
            child: ListView(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(

                        child:  Padding(
                          padding: const EdgeInsets.only(right: 130),
                          child: Text('Create Account',style: TextStyle(color: Colors.red,fontSize: 30),),
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

                              fullNameField,
                              SizedBox(
                                height: 20,
                              ),
                              userNameField,
                              SizedBox(
                                height: 20,
                              ),
                              emailField,
                              SizedBox(
                                height: 20,
                              ),
                              phoneField,
                              SizedBox(
                                height: 20,
                              ),
                              genderField,
                              SizedBox(
                                height: 20,
                              ),
                              bloodGroupField,
                              SizedBox(
                                height: 20,
                              ),
                              passwordField,
                              SizedBox(
                                height: 20,
                              ),
                              conformPasswordField,
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
                                  Text("Already have an account?",style: TextStyle(fontSize: 18),),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                                    },
                                    child: Text(' SIGN IN',style: TextStyle(fontSize: 23,color: Colors.redAccent,fontWeight: FontWeight.bold)),
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
          ) ,

    );
  }
}
