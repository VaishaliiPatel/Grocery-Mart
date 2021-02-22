import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../widgets/CartScreenWidgets/CartList.dart';
import '../widgets/CartScreenWidgets/CheckOut.dart';

class CartScreen extends StatefulWidget {
  static String routeName = 'CartScreen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

final String productDetail =
    'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.';

List<Product> _products = [
  Product(
      name: 'Bell Pepper Red',
      price: 4.99,
      imagePath: 'assets/images/papper.png',
      productDetail: productDetail,
      quantity: '1kg, Price'),
  Product(
      name: 'Egg Chicken Red',
      price: 1.99,
      imagePath: 'assets/images/RedEgg.png',
      productDetail: productDetail,
      quantity: '4pcs, Price'),
  Product(
      name: 'Organic Bananas',
      price: 3.00,
      imagePath: 'assets/images/Banana.png',
      productDetail: productDetail,
      quantity: '12kg, Price'),
  Product(
      name: 'Ginger',
      price: 2.99,
      imagePath: 'assets/images/ginger.png',
      productDetail: productDetail,
      quantity: '250gm, Price'),
  Product(
      name: 'Organic Bananas',
      price: 3.00,
      imagePath: 'assets/images/Banana.png',
      productDetail: productDetail,
      quantity: '12kg, Price'),
  Product(
      name: 'Ginger',
      price: 2.99,
      imagePath: 'assets/images/ginger.png',
      productDetail: productDetail,
      quantity: '250gm, Price'),
];

class _CartScreenState extends State<CartScreen> {
  void _checkOut(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: CheckOutWidget(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'PTSansCaption',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: CartList(_products),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: RaisedButton(
          onPressed: () => _checkOut(context),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Go to Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'PTSansCaption',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(
                "assets/images/12_69.png",
                height: 20,
                width: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
