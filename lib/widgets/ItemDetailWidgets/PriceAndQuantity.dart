import 'package:flutter/material.dart';

class PriceAndQuantity extends StatefulWidget {
  final price;

  PriceAndQuantity(this.price);

  @override
  _PriceAndQuantityState createState() => _PriceAndQuantityState();
}

class _PriceAndQuantityState extends State<PriceAndQuantity> {
  int itemQuantity = 0;

  void onAddRemove() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                icon: Image.asset(
                  "assets/images/minus.png",
                  height: 15,
                  width: 15,
                ),
                onPressed: itemQuantity == 0 ? null : onAddRemove,
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 0.3,
                    color: Colors.grey,
                  ),
                ),
                child: Text(
                  itemQuantity.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSansCaption',
                  ),
                ),
              ),
              IconButton(
                icon: Image.asset(
                  "assets/images/plus.png",
                  height: 15,
                  width: 15,
                ),
                onPressed: () {
                  setState(() {
                    itemQuantity = itemQuantity + 1;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: Text(
              "\$${widget.price}",
              style: TextStyle(
                fontFamily: 'PTSansCaption',
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
