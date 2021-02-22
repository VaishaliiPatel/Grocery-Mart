import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Text(
              "Payment",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontFamily: 'PTSansCaption',
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Image.asset(
                "assets/images/card.png",
                height: 16,
                width: 20,
              )),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Image.asset(
                'assets/images/rightIcon.png',
                height: 14,
                width: 14,
              ),
              color: Colors.grey,
              alignment: Alignment.centerRight,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
