import 'package:flutter/material.dart';

class ItemcardHeading extends StatelessWidget {
  final String heading;
  ItemcardHeading(this.heading);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          heading,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Container(
              // color: Colors.grey,
              margin: EdgeInsets.only(right: 20),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // fontWeight: FontWeight.w500,
                  fontFamily: 'PTSansCaption',
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
