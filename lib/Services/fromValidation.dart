import 'package:flutter/material.dart';

bool validationSave(  GlobalKey<FormState>globalKey){

  final from =globalKey.currentState;

  if(from!.validate()){
    from.save();
    return true;
  }


  return false;
}