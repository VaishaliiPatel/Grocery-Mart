import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final String imagePath;
  final String name;

  DetailWidget(this.name, this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
          ),
          height: 0.2,
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        ),
        //Nutritions widget
        Container(
          margin: EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PTSansCaption',
                  ),
                ),
              ),
              Image.asset(
                imagePath,
                height: 25,
                width: 35,
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/rightIcon.png',
                  height: 12,
                  width: 12,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
