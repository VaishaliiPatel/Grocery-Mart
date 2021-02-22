import 'package:GroceryMart/providers/facebook_signIn_provider.dart';
import 'package:GroceryMart/providers/google_signIn_provider.dart';
import 'package:GroceryMart/screens/OnBording.dart';
import 'package:GroceryMart/widgets/CartScreenWidgets/ProfileBaseLine.dart';
import 'package:GroceryMart/widgets/Profile/MenuItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  static String routeName = 'Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthResult authResult;
  void logout(BuildContext ctx) async {
    final provider = Provider.of<GoogleSignInProvider>(ctx, listen: false);
    final facebookProvider =
        Provider.of<FacebookSignInProvider>(context, listen: false);
    print("----------Provider-----------------------------");
    print(facebookProvider.isLogin);
    print(provider.googleSignIn.currentUser);
    if (provider.googleSignIn.currentUser != null) {
      print("else 2block--------");
      provider.logout(ctx);
    } else if (facebookProvider.isLogin) {
      facebookProvider.signOutFacebook(ctx);
      print("else 1 block--------");
    } else if (provider.googleSignIn.currentUser == null &&
        facebookProvider.isLogin == false) {
      print("if block---------");
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.signOut().then(
        (value) {
          Navigator.pushReplacementNamed(ctx, OnBordingScreen.oruteName);
        },
      );
    } else {
      FirebaseAuth.instance.signOut();
      print("else block--------");
      provider.logout(ctx);
    }
  }

  // var _userName = await Firestore.instance.collection('user').document(authResult.user.uid).get()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: StreamBuilder(
            stream: Firestore.instance.collection('user').snapshots(),
            builder: (ctx, chatSanpShot) {
              if (chatSanpShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final chatDocs = chatSanpShot.data.documents;
              return Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            child: Image.asset(
                              "assets/images/profile.png",
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30,
                                  margin: EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Afsar Hossen",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'PTSansCaption',
                                        ),
                                      ),
                                      IconButton(
                                          icon: Image.asset(
                                            "assets/images/edit.png",
                                            height: 30,
                                            width: 30,
                                          ),
                                          onPressed: null)
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Imshuvo97@gmail.com",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                      fontFamily: 'PTSansCaption',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ProfileBaseLine(),
                    MenuItem("Orders", "assets/images/bag.png"),
                    ProfileBaseLine(),
                    MenuItem("My Details", "assets/images/userDetail.png"),
                    ProfileBaseLine(),
                    MenuItem("Delivery Address", "assets/images/location.png"),
                    ProfileBaseLine(),
                    MenuItem(
                        "Payment Methods", "assets/images/paymentCard.png"),
                    ProfileBaseLine(),
                    MenuItem("Promo Cord", "assets/images/promoCard.png"),
                    ProfileBaseLine(),
                    MenuItem("Notifecations", "assets/images/Bellicon.png"),
                    ProfileBaseLine(),
                    MenuItem("Help", "assets/images/helpicon.png"),
                    ProfileBaseLine(),
                    MenuItem("About", "assets/images/about.png"),
                    ProfileBaseLine(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: RaisedButton(
          onPressed: () => logout(context),
          color: new Color(0xffF2F3F2),
          child: Row(
            children: [
              Image.asset(
                "assets/images/exportIcon.png",
                height: 20,
                width: 35,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PTSansCaption',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
