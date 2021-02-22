import 'dart:io';

import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import './SignIn.dart';
import './OTPScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Registration extends StatefulWidget {
  static String routeName = 'Registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _codeController = TextEditingController();
  final _phoneController = TextEditingController();
  var _isValidate = false;
  var isShowErrorText = false;

  void _onChangeCountry(CountryCode code) {
    _codeController.text = code.toString();
  }

  @override
  void initState() {
    _phoneController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as List<String>;
    print("-------COuntryCode--------");
    print(data[0]);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Platform.isIOS
              ? Icon(Icons.arrow_back_ios)
              : Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              SignInScreen.routeName,
              arguments:
                  _codeController.text == null || _codeController.text.isEmpty
                      ? data[0]
                      : _codeController.text,
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        // height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Enter your mobile number",
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
              "Mobile Number",
              style: TextStyle(
                fontFamily: 'PTSansCaption',
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _phoneController,
              maxLength: 10,
              // autofocus: true,
              textAlignVertical: TextAlignVertical(y: 0.37),
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontFamily: 'PTSansCaption',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                counter: Spacer(),
                errorText: isShowErrorText ? "Enter valid Mobile Number" : null,
                prefixIcon: Container(
                  width: 90,
                  child: Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SvgPicture.network(
                          data[1],
                          height: 20,
                          width: 30,
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text(
                          '+${data[0]}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'PTSansCaption',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //  Container(
                //   width: 120,
                //   child: CountryCodePicker(
                //     onChanged: _onChangeCountry,
                //     initialSelection: countryCode,
                //     showCountryOnly: true,
                //     showOnlyCountryWhenClosed: false,
                //     textStyle: TextStyle(
                //       fontFamily: 'PTSansCaption',
                //       fontSize: 18,
                //     ),
                //     alignLeft: true,
                //   ),
                // ),
              ),
              onChanged: (value) {},
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_phoneController.text.isEmpty ||
                _phoneController.text.length < 10 ||
                _phoneController.text.contains('-') ||
                _phoneController.text.contains(',') ||
                _phoneController.text.contains('.') ||
                _phoneController.text.contains(' ')) {
              print("length ");
              print(_phoneController.text.length);
              _isValidate = false;
              isShowErrorText = true;
            } else {
              _isValidate = true;
              Navigator.of(context).pushNamed(OTPScreen.routeName);
            }
          });
        },
        tooltip: 'Increment',
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20.0,
        ),
      ),
    );
  }
}
