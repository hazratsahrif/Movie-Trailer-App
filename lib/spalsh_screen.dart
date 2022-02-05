import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 5),()=>

        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return ScaleTransition(
                scale: animation,
                alignment: Alignment.center,
                child: MyHomePage(),

              );
            },
            transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
              return Align(
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              );
            },
            transitionDuration: Duration(milliseconds: 300),
          ),
        ),
        );


        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
            )
          ),
        ),

      ),
    );
  }
}
