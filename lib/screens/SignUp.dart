import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/Login.dart';
import '../screens/TabBarNavigation.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = 'SignUp';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TextEditingController _email = new TextEditingController();
  // TextEditingController _password = new TextEditingController();
  // TextEditingController _username = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  String _userEmail = '';
  String _password = '';
  String _userName = '';
  var isLogin = true;
  var isShow = false;

  void onPressLogin() {
    Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
  }

  void onSubmit(BuildContext ctx) async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();

    AuthResult authResult;

    try {
      authResult = await _auth.createUserWithEmailAndPassword(
        email: _userEmail,
        password: _password,
      );
      await Firestore.instance
          .collection('user')
          .document(authResult.user.uid)
          .setData({
        "username": _userName,
        'email': _userEmail,
      });
      Navigator.pushReplacementNamed(context, TabBarScreen.routeName);
    } on PlatformException catch (error) {
      print("--------------------error1-");
      print(error.message);
      var message = "An error occurred, Please check your credential";
      if (error.message != null) {
        message = error.message;
      }
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } catch (error) {
      print("--------------------error2-");
      print(error);
      // setState(() {
      //   _isLoading = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 90, bottom: 80),
                  child: Image.asset(
                    'assets/images/carrotColorIcon.png',
                    height: 60,
                    width: 50,
                  ),
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'PTSansCaption',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter your credentials to continue',
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    color: new Color(0xff7C7C7C),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Username",
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 15,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  key: ValueKey('username'),
                  autofocus: true,
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(),
                  onSaved: (value) {
                    _userName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return "Username must be at least 5 charcter long";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 15,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  key: ValueKey('email'),
                  autofocus: true,
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.done_rounded,
                      // color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    _userEmail = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return "Please enter valid email address";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 15,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  key: ValueKey('password'),
                  autofocus: true,
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: isShow
                          ? Image.asset(
                              'assets/images/eyeIcon.png',
                              height: 20,
                              width: 20,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              size: 25,
                            ),
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                    ),
                  ),
                  onSaved: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return "Password must be at least 7 charcter long";
                    }
                    return null;
                  },
                  obscureText: isShow,
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: 'By continuing you agree to our ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        recognizer: null,
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Private Policy.',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        recognizer: null,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () => onSubmit(context),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'PTSansCaption',
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'SignIn',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
