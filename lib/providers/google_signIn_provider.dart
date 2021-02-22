import 'package:GroceryMart/screens/OnBording.dart';
import 'package:GroceryMart/screens/TabBarNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSignIn;

  GoogleSignInProvider() {
    _isSignIn = false;
  }

  bool get isSigningIn => _isSignIn;

  set isSigningIn(bool isSignIn) {
    _isSignIn = isSignIn;
    notifyListeners();
  }

  Future login(BuildContext context) async {
    _isSignIn = true;
    final user = await googleSignIn.signIn();
    print("--------------user--------");
    print(user);
    if (user == null) {
      _isSignIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      _isSignIn = false;
      Navigator.pushReplacementNamed(context, TabBarScreen.routeName);
      notifyListeners();
    }
  }

  void logout(BuildContext context) async {
    await googleSignIn.disconnect();
    Navigator.pushReplacementNamed(context, OnBordingScreen.oruteName);
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
