import 'package:GroceryMart/screens/SignUp.dart';
import 'package:GroceryMart/screens/TabBarNavigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'Login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _password = '';
  var isLogin = true;
  var _isLoading = false;
  var isShow = false;

  void onSubmit(BuildContext ctx) async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();

    AuthResult authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      authResult = await _auth.signInWithEmailAndPassword(
          email: _userEmail, password: _password);
      Navigator.pushReplacementNamed(context, TabBarScreen.routeName);
      print("--------Suceess----------");
      print(authResult.user.email);
    } on PlatformException catch (error) {
      print("--------------------error1-");
      print(error.message);
      var message = "An error occurred, Please check your credential";
      if (error.message != null) {
        message = error.message;
      }
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print("--------------------error2-");
      print(error);
      setState(() {
        _isLoading = false;
      });
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
                  'Loging',
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
                  'Enter your emails and password',
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
                  "Email",
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 15,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  autofocus: true,
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(),
                  onSaved: (value) {
                    _userEmail = value;
                  },
                  textCapitalization: TextCapitalization.none,
                  key: ValueKey('email'),
                  keyboardType: TextInputType.emailAddress,
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
                  autofocus: true,
                  key: ValueKey('password'),
                  style: TextStyle(
                    fontFamily: 'PTSansCaption',
                    fontSize: 16,
                  ),
                  obscureText: isShow,
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
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () => onSubmit(context),
                  child: Text(
                    'Log In',
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
                      'Don’t have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpScreen.routeName);
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
