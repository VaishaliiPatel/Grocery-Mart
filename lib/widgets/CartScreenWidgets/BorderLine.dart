import 'package:flutter/material.dart';

class BorderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color: Colors.grey[400],
        ),
      ),
      height: 0.2,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
    );
  }
}
