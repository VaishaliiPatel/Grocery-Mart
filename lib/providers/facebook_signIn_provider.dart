import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:GroceryMart/screens/OnBording.dart';
import 'package:GroceryMart/screens/TabBarNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookSignInProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin facebookLoginFn = FacebookLogin();
  FirebaseUser _user;
  var isLogin = false;

  Future _loginWithFacebook(
      FacebookLoginResult result, BuildContext context) async {
    try {
      FacebookAccessToken _accessToken = result.accessToken;
      AuthCredential _authCredential =
          FacebookAuthProvider.getCredential(accessToken: _accessToken.token);
      var data = await _auth.signInWithCredential(_authCredential);
      print("---------data---");
      print(data.user.providerData[0].displayName);
      isLogin = true;
      _user = data.user;
      Navigator.pushReplacementNamed(context, TabBarScreen.routeName);
      notifyListeners();
    } catch (error) {
      print("--------error----------");
      print(error);
    }
  }

  Future facebookLogin(BuildContext context) async {
    FacebookLoginResult _result = await facebookLoginFn.logIn(['email']);
    print("---------resulkt------");
    print(_result.status);
    switch (_result.status) {
      case FacebookLoginStatus.cancelledByUser:
        print('--------cancle-----');
        break;
      case FacebookLoginStatus.error:
        print("-------Error------");
        print(FacebookLoginStatus.error);
        break;
      case FacebookLoginStatus.loggedIn:
        await _loginWithFacebook(_result, context);
        break;
    }
  }

  Future signOutFacebook(BuildContext context) async {
    // FocusManager.instance.dispose();_
    Firestore.instance.settings(persistenceEnabled: false);
    await _auth.signOut().then((value) {
      facebookLoginFn.logOut();
      print("logout from facebook");
      isLogin = false;
      _user = null;
      Navigator.pushReplacementNamed(context, OnBordingScreen.oruteName);
    });
    notifyListeners();
  }
}
