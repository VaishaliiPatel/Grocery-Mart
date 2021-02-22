import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../models/Product.dart';
import '../../screens/ItemDetail.dart';

class ItemCard extends StatelessWidget {
  final List<Product> products;

  ItemCard(this.products);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map(
          (e) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ItemDetailScreen.routeName,
                  arguments: e,
                );
              },
              child: Container(
                width: 170,
                height: 225,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 5, bottom: 10, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.deepOrangeAccent[100],
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                        left: 5,
                        right: 5,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        e.imagePath,
                        height: 80,
                        width: 100,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      e.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      e.quantity,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "\$${e.price}",
                              style: TextStyle(
                                fontFamily: '',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            // padding: EdgeInsets.only(right: 5, bottom: 5),
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                // size: 25,
                              ),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  ItemDetailScreen.routeName,
                                  arguments: e,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
