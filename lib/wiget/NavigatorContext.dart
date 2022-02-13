import 'package:flutter/material.dart';

navogatorPage(BuildContext context,Widget page){

  Navigator.push(context, MaterialPageRoute(builder: (context)=>page));


}