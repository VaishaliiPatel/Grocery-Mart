import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: new Color(0xff53B175),
        ),
        child: Center(
          // heightFactor: 50,
          child: Image.asset(
            "assets/images/logoOne.png",
            height: 70,
            width: 270,
          ),
        ),
      ),
    );
  }
}
