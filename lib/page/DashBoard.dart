import 'package:blooddonation/page/About.dart';
import 'package:blooddonation/page/BloodGroup.dart';
import 'package:blooddonation/page/Donar.dart';
import 'package:blooddonation/page/Request.dart';
import 'package:blooddonation/wiget/DashBoard/IconContent.dart';
import 'package:blooddonation/wiget/DashBoard/ReuseCard.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: (){Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => BloodGroup()));},
                      child: ReuseCard(
                          color: Colors.red,
                          cardChild: IconContent(
                            iconData: Icons.bloodtype_outlined,
                            text: 'BLOOD GROUP',
                          )),
                    )),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Request()));
                      },
                      child: ReuseCard(
                          color: Colors.red,
                          cardChild: IconContent(
                            iconData: Icons.bloodtype_outlined,
                            text: 'BLOOD GROUP',
                          )),
                    ))
              ],
            ),
          ),
          Expanded(
              child: ReuseCard(
            color: Colors.red,
            cardChild: Container(),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: (){  Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => About()));},
                      child: ReuseCard(
                          color: Colors.red,
                          cardChild: IconContent(
                            iconData: Icons.bloodtype_outlined,
                            text: 'BLOOD GROUP',
                          )),
                    )),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Donar()));
                      },
                      child: ReuseCard(
                  color: Colors.red,
                  cardChild: IconContent(
                      iconData: Icons.bloodtype_outlined,
                      text: 'BLOOD GROUP',
                  ),
                ),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 90.0,
            color: Colors.red,


            child: ElevatedButton(
              onPressed: (){},
              child: Text('Log Out'),
            ),
          )
        ],
      ),
    );
  }
}
