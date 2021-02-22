import 'package:GroceryMart/screens/CartScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/ItemDetailWidgets/DetailWidget.dart';
import '../widgets/ItemDetailWidgets/PriceAndQuantity.dart';
import '../widgets/ItemDetailWidgets/Review.dart';
import '../models/Product.dart';

class ItemDetailScreen extends StatefulWidget {
  static String routeName = 'Itemdetail';
  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  var isExpand = true;
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios_sharp),
        backgroundColor: Colors.grey[200],
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/images/export.png',
              height: 18,
              width: 18,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 60,
                bottom: 50,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              alignment: Alignment.center,
              child: FadeInImage(
                placeholder: AssetImage(product.imagePath),
                image: AssetImage(
                  product.imagePath,
                ),
              ),
            ),
            //Item heading
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Naturel Red Apple",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/Favourite.png',
                      width: 22,
                      height: 20,
                      color: Colors.grey[600],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                product.quantity,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontFamily: 'PTSansCaption',
                ),
              ),
            ),
            //Price and quantity container
            PriceAndQuantity(product.price),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
              ),
              height: 0.2,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            ),
            //Product Detail
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Product Detail",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'PTSansCaption',
                      ),
                    ),
                  ),
                  IconButton(
                      icon: isExpand
                          ? Icon(Icons.expand_more, size: 25)
                          : Icon(Icons.expand_less, size: 25),
                      onPressed: () {
                        setState(() {
                          isExpand = !isExpand;
                        });
                      }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: isExpand ? 45 : 0,
              child: Text(
                product.productDetail,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontFamily: 'PTSansCaption',
                ),
              ),
            ),
            DetailWidget("Nutritions", "assets/images/110gmLogo.png"),
            Review("Review", "assets/images/rating.png"),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                child: Text(
                  'Add To Basket',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'PTSansCaption',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
