import 'package:flutter/material.dart';
import '../models/Product.dart';

final String productDetail =
    'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.';

class Productprovider with ChangeNotifier {
  List<Product> _products = [
    Product(
        name: 'Diet Coke',
        price: 1.99,
        imagePath: 'assets/images/coke.png',
        productDetail: productDetail,
        quantity: '355ml, Price'),
    Product(
        name: 'Sprite Can',
        price: 1.50,
        imagePath: 'assets/images/sprite.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Apple & Grape Juice',
        price: 15.99,
        imagePath: 'assets/images/appleJuice.png',
        productDetail: productDetail,
        quantity: '2L, Price'),
    Product(
        name: 'Orenge Juice',
        price: 15.99,
        imagePath: 'assets/images/OrangeJuice.png',
        productDetail: productDetail,
        quantity: '2L, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Pepsi Can ',
        price: 4.99,
        imagePath: 'assets/images/pepsi.png',
        productDetail: productDetail,
        quantity: '330ml, Price'),
    Product(
        name: 'Organic Bananas',
        price: 4.99,
        imagePath: 'assets/images/Banana.png',
        productDetail: productDetail,
        quantity: '7pcs, Priceg'),
    Product(
        name: 'Red Apple',
        price: 4.99,
        imagePath: 'assets/images/apple.png',
        productDetail: productDetail,
        quantity: '1kg, Price'),
    Product(
        name: 'Bell Pepper Red',
        price: 4.99,
        imagePath: 'assets/images/papper.png',
        productDetail: productDetail,
        quantity: '1kg, Price'),
    Product(
        name: 'Ginger',
        price: 4.99,
        imagePath: 'assets/images/ginger.png',
        productDetail: productDetail,
        quantity: '250gm, Price'),
    Product(
        name: 'Egg Chicken Red',
        price: 4.99,
        imagePath: 'assets/images/RedEgg.png',
        productDetail: productDetail,
        quantity: '4pcs, Price'),
    Product(
        name: 'Beef Bone',
        price: 4.99,
        imagePath: 'assets/images/beef.png',
        productDetail: productDetail,
        quantity: '1kg, Priceg'),
    Product(
        name: 'Broiler Chicken',
        price: 4.99,
        imagePath: 'assets/images/chicken.png',
        productDetail: productDetail,
        quantity: '1kg, Priceg'),
    Product(
        name: 'Egg Chicken White',
        price: 4.99,
        imagePath: 'assets/images/Egg.png',
        productDetail: productDetail,
        quantity: '180g, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
    Product(
        name: 'Coca Cola Can',
        price: 4.99,
        imagePath: 'assets/images/Cocacola.png',
        productDetail: productDetail,
        quantity: '325ml, Price'),
  ];
  List<Product> searchItem(String data) {
    List<Product> dataList = [];
    _products.map((e) {
      if (e.name.toLowerCase().contains(data.toLowerCase())) {
        dataList.add(e);
      }
    }).toList();
    print("_______________Datalist--------------");
    print(dataList);
    return dataList;
  }
}
