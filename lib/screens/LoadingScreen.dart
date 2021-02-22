import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static String routeName = 'LoadingScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading........"),
      ),
    );
  }
}
