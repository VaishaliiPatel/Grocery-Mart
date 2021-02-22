import 'package:flutter/material.dart';
import '../../models/Product.dart';

class CartList extends StatelessWidget {
  List<Product> _products;
  CartList(this._products);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.77,
      width: double.infinity,
      // margin: EdgeInsets.only(
      //   left: 20,
      //   right: 20,
      // ),
      child: SingleChildScrollView(
        child: Column(
          children: _products.map((e) {
            return Container(
              height: 130,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.3,
                    color: Colors.grey,
                  ),
                ),
              ),
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                children: [
                  Image.asset(
                    e.imagePath,
                    height: 60,
                    width: 80,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'PTSansCaption',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      e.quantity,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'PTSansCaption',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Image.asset(
                                  'assets/images/cross.png',
                                  height: 14,
                                  width: 14,
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 0.4,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: IconButton(
                                        icon: Image.asset(
                                          "assets/images/minus.png",
                                          height: 15,
                                          width: 15,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PTSansCaption',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 0.4,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: IconButton(
                                        icon: Image.asset(
                                          "assets/images/plus.png",
                                          height: 15,
                                          width: 15,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Text(
                                    "\$${e.price}",
                                    style: TextStyle(
                                      fontFamily: 'PTSansCaption',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
