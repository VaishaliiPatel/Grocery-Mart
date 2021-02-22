import 'package:flutter/material.dart';

class CheckItem extends StatefulWidget {
  bool isCheck;
  String name;

  CheckItem(this.isCheck, this.name);
  @override
  _CheckItemState createState() => _CheckItemState();
}

class _CheckItemState extends State<CheckItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          margin: EdgeInsets.only(
            right: 20,
          ),
          child: GestureDetector(
            child: !widget.isCheck
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.6,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                : Image.asset(
                    "assets/images/check.png",
                    height: 24,
                    width: 24,
                  ),
            onTap: () {
              setState(() {
                widget.isCheck = !widget.isCheck;
              });
            },
          ),
        ),
        Text(
          widget.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:
                widget.isCheck ? Theme.of(context).primaryColor : Colors.black,
          ),
        ),
      ],
    );
  }
}
