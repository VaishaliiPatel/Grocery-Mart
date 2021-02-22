import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:GroceryMart/providers/countryData.dart';
import 'package:GroceryMart/providers/facebook_signIn_provider.dart';
import 'package:GroceryMart/screens/LoadingScreen.dart';
import 'package:GroceryMart/screens/LocationScreen.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';
import '../providers/google_signIn_provider.dart';
import '../screens/Registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/DropDownItem.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "SignIn";
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _phoneContoller = new TextEditingController();
  var countryValue;
  Future<List<Country>> countrydata;
  // var _isLogin = false;
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // FacebookLogin _facebookLogin = FacebookLogin();
  // FirebaseUser _user;

  // Future _loginWithFacebook(FacebookLoginResult result) async {
  //   try {
  //     FacebookAccessToken _accessToken = result.accessToken;
  //     AuthCredential _authCredential =
  //         FacebookAuthProvider.getCredential(accessToken: _accessToken.token);
  //     var data = await _auth.signInWithCredential(_authCredential);
  //     print("---------data---");
  //     print(data.user.providerData[0].displayName);

  //     setState(() {
  //       _isLogin = true;
  //       _user = data.user;
  //     });
  //   } catch (error) {
  //     print("--------error----------");
  //     print(error);
  //   }
  // }

  // Future facebookLogin() async {
  //   FacebookLoginResult _result = await _facebookLogin.logIn(['email']);
  //   print("---------resulkt------");
  //   print(_result.status);
  //   switch (_result.status) {
  //     case FacebookLoginStatus.cancelledByUser:
  //       print('--------cancle-----');
  //       break;
  //     case FacebookLoginStatus.error:
  //       print("-------Error------");
  //       print(FacebookLoginStatus.error);
  //       break;
  //     case FacebookLoginStatus.loggedIn:
  //       await _loginWithFacebook(_result);
  //       break;
  //   }
  // }

  // Future signOutFacebook() async {
  //   await _auth.signOut().then((value) {
  //     setState(() {
  //       _facebookLogin.logOut();
  //       _isLogin = false;
  //     });
  //   });
  // }
  _facebookLogin(BuildContext context) async {
    final provider =
        Provider.of<FacebookSignInProvider>(context, listen: false);
    provider.facebookLogin(context);
  }

  @override
  void initState() {
    // final data = fetchCountry();
    //     Provider.of<CountyProvider>(context, listen: false).fetchCountry();
    // setState(() {
    //   countrydata = data;
    // });
    print("----------Data 1----------");
    countrydata = fetchCountry();
    // print(countrydata.length);
    // print(data['']);
    super.initState();
  }

  void _onChangeCountry(String code, String url) {
    _phoneContoller.text = code.toString();
    Navigator.of(context)
        .pushNamed(Registration.routeName, arguments: [code.toString(), url]);
    // print('------------Code----------');
    // print(code);
  }

  void onPressGoogleSignIn() {}

  @override
  Widget build(BuildContext context) {
    final countryCode = ModalRoute.of(context).settings.arguments;
    // print("--------------Back-code-------------");
    // print(countryCode);
    final googleContainer = new Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: RaisedButton(
        color: new Color(0xff4285F4),
        padding: EdgeInsets.all(-20),
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login(context);
          print("--------------------provider---");
          print(provider);
        },
        child: Row(
          children: [
            Container(
              height: 20,
              // width: 50,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Image.asset('assets/images/googleIcon.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Continue with Google",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'PTSansCaption',
              ),
            )
          ],
        ),
      ),
    );
    final facebookConatiner = new Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: RaisedButton(
        color: new Color(0xff4267B2),
        padding: EdgeInsets.all(-20),
        onPressed: () => _facebookLogin(context),
        child: Row(
          children: [
            Container(
              height: 20,
              // width: 50,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Image.asset('assets/images/facebookIcon.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Continue with Facebook",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'PTSansCaption',
              ),
            )
          ],
        ),
      ),
    );
    // padding: EdgeInsets.symmetric(horizontal: 0),
    // child: Row(
    // children: [
    //   Expanded(
    //     child: CountryCodePicker(
    //       onChanged: _onChangeCountry,
    //       initialSelection: countryCode == null ? 'IN' : countryCode,
    //       favorite: ['+91', 'IN'],
    //       showCountryOnly: true,
    //       showOnlyCountryWhenClosed: false,
    //       textStyle: TextStyle(
    //         fontFamily: 'PTSansCaption',
    //         fontSize: 18,
    //       ),
    //       // optional. aligns the flag and the Text left
    //       alignLeft: true,
    //     ),
    //   ),
    // SizedBox(height: 16.0),
    // Expanded(
    //   child: TextFormField(
    //     controller: _phoneContoller,
    //     keyboardType: TextInputType.phone,
    //     autofocus: false,
    //     style: new TextStyle(
    //       fontSize: 14,
    //       fontWeight: FontWeight.w400,
    //     ),
    //   ),
    // ),
    // SizedBox(height: 16.0),
    // ],
    // ),

    return Scaffold(
      body: FutureBuilder<List<Country>>(
        future: countrydata,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            print("----------------------------Name-------------------------");
            print(snapshot.data[0]);
            return Container(
              height: double.infinity,
              // width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/shoppingBag.png"),
                    alignment: Alignment.topCenter),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(right: 120),
                      child: Text(
                        "Get your groceries with nectar",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PTSansCaption',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // countryContainer,
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 0,
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.7,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        // icon: null,
                        // isDense: false,
                        underline: null,
                        // disabledHint: true,
                        value: countryValue,
                        hint: Text(
                          "Type of your zone",
                          style: TextStyle(
                            fontFamily: 'PTSansCaption',
                            fontSize: 18,
                            color: Colors.grey[400],
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            print("------vlaue=----------------");
                            print(value);
                            countryValue = value;
                          });
                        },
                        items: snapshot.data.map((e) {
                          return DropdownMenuItem(
                            value: e.code,
                            child: Container(
                              // padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    margin: EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: SvgPicture.network(
                                      e.imageURL,
                                      height: 20,
                                      width: 30,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 10, left: 10),
                                    child: Text(
                                      '+${e.name}',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PTSansCaption',
                                      ),
                                    ),
                                  )
                                ],
                                // Text(
                                //   e.name,
                                //   style: TextStyle(
                                //     fontFamily: 'PTSansCaption',
                                //     fontSize: 18,
                                //     color: Colors.black,
                                //   ),
                                // ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      // GestureDetector(
                      // child: Row(
                      //   children: [
                      //     Container(
                      //       clipBehavior: Clip.antiAliasWithSaveLayer,
                      //       margin: EdgeInsets.only(
                      //         bottom: 10,
                      //       ),
                      //       decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(5),
                      //       ),
                      //       child: SvgPicture.network(
                      //         snapshot.data.imageURL,
                      //         height: 25,
                      //         width: 35,
                      //       ),
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.only(bottom: 10, left: 10),
                      //       child: Text(
                      //         '+${snapshot.data.code[0]}',
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.w400,
                      //           fontFamily: 'PTSansCaption',
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      //   ),
                      //   onTap: () => _onChangeCountry(
                      //       snapshot.data.code[0], snapshot.data.imageURL),
                      // ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Or connect with social media",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'PTSansCaption',
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    googleContainer,
                    SizedBox(
                      height: 15,
                    ),
                    facebookConatiner,
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            print("-----------------Eorror---------");
            print(snapshot.error);
            // print(snapshot.
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Future<List<Country>> fetchCountry() async {
  final url = "https://restcountries.eu/rest/v2/all";
  final response = await http.get(url);
  List<Country> dataList = [];
  print("--------------------countryfrom fatch---");
  print(jsonDecode(response.body));
  final jsonData = jsonDecode(response.body) as List;
  print(response.statusCode);
  if (response.statusCode == 200) {
    jsonData.forEach(
      (element) {
        dataList.add(
          Country.fromJson(element),
        );
      },
    );
    return dataList;
    // return Country.fromJson(jsonData);
  } else {
    print("--------------------error---");
    throw Exception("Faild to load data");
  }
}
