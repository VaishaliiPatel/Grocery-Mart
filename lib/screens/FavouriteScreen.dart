import 'package:flutter/material.dart';
import '../models/Product.dart';

class FavouriteScreen extends StatefulWidget {
  static String routeName = 'FavouriteScreen';
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

final String productDetail =
    'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.';

List<Product> _products = [
  Product(
      name: 'Sprite Can',
      price: 1.50,
      imagePath: 'assets/images/sprite.png',
      productDetail: productDetail,
      quantity: '325ml, Price'),
  Product(
      name: 'Diet Coke',
      price: 1.99,
      imagePath: 'assets/images/coke.png',
      productDetail: productDetail,
      quantity: 'Diet Coke'),
  Product(
      name: 'Apple & Grape Juice',
      price: 15.50,
      imagePath: 'assets/images/appleJuice.png',
      productDetail: productDetail,
      quantity: '2L, Price'),
  Product(
      name: 'Coca Cola Can',
      price: 4.99,
      imagePath: 'assets/images/coke.png',
      productDetail: productDetail,
      quantity: '325ml, Price'),
  Product(
      name: 'Pepsi Can ',
      price: 4.99,
      imagePath: 'assets/images/Banana.png',
      productDetail: productDetail,
      quantity: '330ml, Price'),
  Product(
      name: 'Coca Cola Can',
      price: 4.99,
      imagePath: 'assets/images/coke.png',
      productDetail: productDetail,
      quantity: '325ml, Price'),
];

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'PTSansCaption',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
              children: _products.map((e) {
            return Container(
              height: 115,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.3,
                    color: Colors.grey,
                  ),
                ),
              ),
              // margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    e.imagePath,
                    height: 60,
                    width: 80,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
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
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "\$${e.price}",
                              style: TextStyle(
                                fontFamily: '',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: Image.asset(
                                'assets/images/rightIcon.png',
                                height: 14,
                                width: 14,
                              ),
                              color: Colors.grey,
                              alignment: Alignment.centerRight,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList()),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: RaisedButton(
          onPressed: () {},
          child: Text(
            'Add All To Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
