import 'package:flutter/material.dart';
import './SignIn.dart';

class OnBordingScreen extends StatelessWidget {
  static String oruteName = "OnBoarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 60,
              width: 50,
              child: Image.asset('assets/images/carrotIcon.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Text(
                "Welcome to our store",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PTSansCaption',
                    fontSize: 46,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Get your groceries in as fast as one hour",
              style: TextStyle(
                fontFamily: 'PTSansCaption',
                color: Colors.grey[400],
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignInScreen.routeName);
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontFamily: 'PTSansCaption',
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
