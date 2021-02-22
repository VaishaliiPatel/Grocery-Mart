import 'dart:io';

import 'package:flutter/material.dart';
import './LocationScreen.dart';
import './Registration.dart';

class OTPScreen extends StatefulWidget {
  static String routeName = 'OTPScreen';
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _codeController = TextEditingController();
  var _isValidate = false;
  var isShowErrorText = false;
  @override
  void initState() {
    _codeController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _displaySnackBar() {
    //
    // Scaffold.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       "Code resent successfully",
    //       style: TextStyle(color: Colors.white),
    //     ),
    //      backgroundColor: Theme.of(context).primaryColor,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          //pending platfom info.
          icon: Platform.isIOS
              ? Icon(Icons.arrow_back_ios)
              : Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              Registration.routeName,
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Enter your 4-digit code",
              style: TextStyle(
                fontFamily: 'PTSansCaption',
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Code",
              style: TextStyle(
                fontFamily: 'PTSansCaption',
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              autofocus: true,
              style: TextStyle(
                fontFamily: 'PTSansCaption',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                errorText: isShowErrorText ? "Enter valid code" : null,
                counter: Spacer(),
              ),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: FlatButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      fontFamily: 'PTSansCaption',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_codeController.text.isEmpty ||
                        _codeController.text.length < 4 ||
                        _codeController.text.contains('-') ||
                        _codeController.text.contains(',') ||
                        _codeController.text.contains('.') ||
                        _codeController.text.contains(' ')) {
                      print("length ");
                      print(_codeController.text.length);
                      _isValidate = false;
                      isShowErrorText = true;
                    } else {
                      _isValidate = true;
                      Navigator.of(context).pushNamed(LocationScreen.routeName);
                    }
                  });
                },
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
