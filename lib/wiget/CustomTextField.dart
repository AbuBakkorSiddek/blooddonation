import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyBoardType;
  final bool  obscuretext;
  final Widget? prifixicon;
  final Widget? sufixicon;
  final int? maxlength;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final String? Function(String?)?  validator;
  final String? Function(String?)?  onSaved;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyBoardType,
    this. obscuretext=false,
    this.prifixicon,
    this.sufixicon,
    this.maxlength,
    this.textInputAction,
    required this.autofocus,
    this. validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: autofocus,
        obscureText: obscuretext,
        controller: controller,
        keyboardType: keyBoardType,
        textInputAction:textInputAction ,
        validator:  validator,
        onSaved:onSaved,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prifixicon,
            suffixIcon: sufixicon,
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }
}
