import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../widgets/CategoryWidgets/CategoryCardList.dart';

List<Product> _products = [
  Product(
      name: 'Diet Coke',
      price: 1.99,
      imagePath: 'assets/images/coke.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '355ml, Price'),
  Product(
      name: 'Sprite Can',
      price: 1.50,
      imagePath: 'assets/images/sprite.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '325ml, Price'),
  Product(
      name: 'Apple & Grape Juice',
      price: 15.99,
      imagePath: 'assets/images/appleJuice.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '2L, Price'),
  Product(
      name: 'Orenge Juice',
      price: 15.99,
      imagePath: 'assets/images/OrangeJuice.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '2L, Price'),
  Product(
      name: 'Coca Cola Can',
      price: 4.99,
      imagePath: 'assets/images/Cocacola.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '325ml, Price'),
  Product(
      name: 'Pepsi Can ',
      price: 4.99,
      imagePath: 'assets/images/pepsi.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '330ml, Price'),
  Product(
      name: 'Orenge Juice',
      price: 15.99,
      imagePath: 'assets/images/OrangeJuice.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '2L, Price'),
  Product(
      name: 'Coca Cola Can',
      price: 4.99,
      imagePath: 'assets/images/Cocacola.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '325ml, Price'),
  Product(
      name: 'Pepsi Can ',
      price: 4.99,
      imagePath: 'assets/images/pepsi.png',
      productDetail:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      quantity: '330ml, Price'),
];

class CategoryScreen extends StatefulWidget {
  static String routeNmae = 'CategoryScreen';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          categoryName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'PTSansCaption',
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Image.asset(
                'assets/images/filter.png',
                height: 20,
                width: 20,
              ),
              onPressed: () {
                print(categoryName);
              },
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: GridView.builder(
          itemCount: _products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (ctx, index) {
            return CategoryCardList(_products[index]);
          },
        ),
      ),
    );
  }
}
