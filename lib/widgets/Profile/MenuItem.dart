import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  String menu;
  String imagePath;

  MenuItem(this.menu, this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 20,
            width: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            menu,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'PTSansCaption',
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Image.asset(
                  "assets/images/rightIcon.png",
                  height: 12,
                  width: 15,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
