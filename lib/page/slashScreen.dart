import 'dart:async';

import 'package:blooddonation/page/login.dart';
import 'package:blooddonation/Services/NavigatorContext.dart';
import 'package:flutter/material.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({Key? key}) : super(key: key);

  @override
  _SlashScreenState createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer( Duration(seconds:3 ),
            ()=>navogatorPage(context,Login()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body:  Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  child: Image.asset('images/bloodicon.png') ,
                ),
              ),
              const SizedBox(height: 15,),
              const Text('BLOOD DONATION',style: TextStyle(fontSize: 35,color: Colors.red,fontWeight: FontWeight.bold),)
            ],
          ),
        )

    );
  }
}
