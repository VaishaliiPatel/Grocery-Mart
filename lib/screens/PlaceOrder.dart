import 'package:flutter/material.dart';

class PlaceOrder extends StatelessWidget {
  static String routeName = 'PlaceOrder';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  bottom: 25,
                  right: 30,
                ),
                child: Image.asset(
                  "assets/images/placeOrder.png",
                  height: 230,
                  width: 260,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40,
                  right: 40,
                  bottom: 15,
                ),
                child: Text(
                  'Your Order has been accepted',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'PTSansCaption',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                    bottom: 20),
                child: Text(
                  'Your items has been placcd and is on it’s way to being processed',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'PTSansCaption',
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    // bottom: 10,
                    right: 20,
                    left: 20),
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(PlaceOrder.routeName);
                  },
                  child: Text(
                    'Track Order',
                    style: TextStyle(
                      fontFamily: 'PTSansCaption',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                child: FlatButton(
                  child: Text(
                    "Back to home",
                    style: TextStyle(
                      fontFamily: 'PTSansCaption',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
