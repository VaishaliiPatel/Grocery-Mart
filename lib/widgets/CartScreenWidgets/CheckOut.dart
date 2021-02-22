import 'package:GroceryMart/widgets/CartScreenWidgets/PopupLayout.dart';
import 'package:flutter/material.dart';
import '../../screens/PlaceOrder.dart';
import '../../widgets/CartScreenWidgets/BorderLine.dart';
import '../../widgets/CartScreenWidgets/DeliveryDetail.dart';
import '../../widgets/CartScreenWidgets/Payment.dart';
import '../../widgets/CartScreenWidgets/PromoCode.dart';
import '../../widgets/CartScreenWidgets/TotalAmount.dart';

class CheckOutWidget extends StatefulWidget {
  @override
  _CheckOutWidgetState createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {
  onOrderFailed() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              // width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    // color: Colors.grey,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/images/cross.png",
                        color: Colors.black,
                        height: 15,
                        width: 15,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      // top: 10,
                      bottom: 25,
                      // right: 30,
                    ),
                    child: Image.asset(
                      "assets/images/bucket.png",
                      height: 220,
                      width: 220,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    child: Text(
                      'Oops! Order Failed',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'PTSansCaption',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text(
                      'Something went tembly wrong.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontFamily: 'PTSansCaption',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 10,
                        // bottom: 10,
                        right: 20,
                        left: 20),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed(PlaceOrder.routeName);
                      },
                      child: Text(
                        'Please Try Again',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'PTSansCaption',
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
                          color: Colors.black,
                          fontFamily: 'PTSansCaption',
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName('/'));
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              border: Border.all(
                width: 0.3,
                color: Colors.grey[400],
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'PTSansCaption',
                  ),
                ),
                Expanded(
                  child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: Image.asset(
                      "assets/images/cross.png",
                      height: 16,
                      width: 20,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
          DeliveryDetail(),
          BorderLine(),
          Payment(),
          BorderLine(),
          Promocode(),
          BorderLine(),
          TotalAmount(),
          BorderLine(),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 20,
              right: MediaQuery.of(context).size.width * 0.4,
            ),
            child: RichText(
              text: TextSpan(
                text: 'By placing an order you agree to our ',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'PTSansCaption',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PTSansCaption',
                    ),
                    recognizer: null,
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PTSansCaption',
                    ),
                    recognizer: null,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
            child: RaisedButton(
              onPressed: () =>
                  // this.onOrderFailed(),
                  Navigator.of(context).pushNamed(PlaceOrder.routeName),
              child: Text(
                'Place Order',
                style: TextStyle(
                  fontFamily: 'PTSansCaption',
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
