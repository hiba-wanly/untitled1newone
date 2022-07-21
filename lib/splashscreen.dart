import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1newone/drawer/drawer.dart';
import 'package:untitled1newone/drawer/setting/account.dart';
import 'package:untitled1newone/main.dart';
import 'package:untitled1newone/main_screen/main_screen.dart';

//
// void main() {
//   runApp(SplashScreen());
// }

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => Home(),
    ));
  }
  @override
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: new Color(0xffF5591F),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/airplane - Copy.gif'),),
            ),
          ),
          // Center(
          //   child: Container(
          //     child: Image.asset("images/airplane - Copy.gif"),
          //   ),
          // )
        ],
      ),
    );
  }
}