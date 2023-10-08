import 'package:flutter/material.dart';
import 'package:sdtogether/LoginPage/login_screen.dart';
import 'dart:async';
class MySplashScreen extends StatefulWidget {

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  splashScreenTimer(){

    Timer(const Duration(seconds: 6),() async{
       Navigator.push(context, MaterialPageRoute(builder: (c)=>Login()));
    });
  }

  @override
  void initState(){

    super.initState();
    splashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white,

          ],
           begin:FractionalOffset(0.0,0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0,1.0],
           tileMode: TileMode.clamp,

        ),
      ),
    child: Center(
    child:Image.asset(
      'assets/images/login1.png',
      fit: BoxFit.contain,
    ),
    ),
      ),
    );

  }
}
