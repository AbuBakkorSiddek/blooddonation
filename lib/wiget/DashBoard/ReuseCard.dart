import 'package:flutter/material.dart';

class ReuseCard extends StatelessWidget {
  final Widget cardChild;
  final Color color;

  ReuseCard({
    Key? key,
    required this.color, required this.cardChild
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:cardChild ,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}