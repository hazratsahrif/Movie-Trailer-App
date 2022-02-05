import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/home_screen.dart';
import 'package:lottie/lottie.dart';






void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
     home: MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.


    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 4000),()=>


    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
          ),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Trailer",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: 'Ringbearer',
              backgroundColor: Colors.black.withOpacity(0.5),
                letterSpacing: 6,

            ),
          ),
          SizedBox(
              width: 170,
              height: 170,
              child: Lottie.asset("assets/play.json")),




          // const CircularProgressIndicator(
          //   color: Colors.red,
          // ),
        ],
      )
    );
  }
}



