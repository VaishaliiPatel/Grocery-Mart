import 'package:flutter/material.dart';

class TotalAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Text(
              "Total Cost",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'PTSansCaption',
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "\$13.97",
              style: TextStyle(
                fontFamily: 'PTSansCaption',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
          ),
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
