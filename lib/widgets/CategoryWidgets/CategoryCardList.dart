import 'package:flutter/material.dart';
import '../../screens/ItemDetail.dart';
import '../../models/Product.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryCardList extends StatelessWidget {
  Product _product;

  CategoryCardList(this._product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ItemDetailScreen.routeName,
          arguments: _product,
        );
      },
      child: Container(
        // width: 170,
        // height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.only(left: 12, right: 12, top: 12),
        // margin: EdgeInsets.only(top: 5, bottom: 10, right: 15),
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
                top: 5,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                _product.imagePath,
                height: MediaQuery.of(context).size.height * 0.09,
                width: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: Text(
                _product.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PTSansCaption',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _product.quantity,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontFamily: 'PTSansCaption',

                // fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "\$${_product.price}",
                      style: TextStyle(
                        fontFamily: 'PTSansCaption',
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
                          arguments: _product,
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
  }
}
