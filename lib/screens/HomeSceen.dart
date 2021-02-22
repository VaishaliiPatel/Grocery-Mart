import 'package:GroceryMart/providers/productProviders.dart';
import 'package:GroceryMart/widgets/CategoryWidgets/CategoryCardList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/HomeScreenWidgets/ImageSlider.dart';
import '../widgets/HomeScreenWidgets/ItemCard.dart';
import '../widgets/HomeScreenWidgets/ItemCardHeading.dart';
import '../widgets/HomeScreenWidgets/Category.dart';
import '../models/Product.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final String productDetail =
    'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.';

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  List<Product> productList = [];

  List<Product> _products = [
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
        name: 'Organic Bananas',
        price: 4.99,
        imagePath: 'assets/images/Banana.png',
        productDetail: productDetail,
        quantity: '7pcs, Priceg'),
  ];
  List<Product> _bestSelling = [
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
  ];
  List<Product> _groceries = [
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
  ];
  List _category = [
    {
      "name": "Pulses",
      "imagePath": "assets/images/pulses.png",
      "color": new Color(0xffFDECDB)
    },
    {
      "name": "Rice",
      "imagePath": "assets/images/rice.png",
      "color": new Color(0xffD4EBDD)
    },
    {
      "name": "Pulses",
      "imagePath": "assets/images/pulses.png",
      "color": new Color(0xffFDECDB)
    },
  ];
  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Future<void> onSearchhText(String value) async {
    productList = Provider.of<Productprovider>(context, listen: false)
        .searchItem(_searchController.text);
    print('----------------value-----');
    print(productList);
    print(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final searchBar = new Container(
      width: MediaQuery.of(context).size.width - 40,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical(y: 0.2),
          controller: _searchController,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Search Store',
            border: InputBorder.none,
            prefixIcon: Container(
              margin: const EdgeInsets.only(
                top: 17,
                bottom: 17,
                left: 17,
                right: 10,
              ),
              child: Image.asset(
                'assets/images/SearchIcon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'PTSansCaption',
          ),
          onChanged: (value) => onSearchhText(value),
        ),
      ),
    );
    final imageContariner = new Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/LocationIcon.png',
            height: 18,
            width: 15,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Dhaka, Banassre",
            style: TextStyle(
              fontFamily: 'PTSansCaption',
              fontSize: 18,
              color: Colors.grey[900],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 20),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/carrotColorIcon.png',
                  height: 30,
                  width: 35,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              imageContariner,
              searchBar,
              if (_searchController.text.length == 0)
                Column(
                  children: [
                    ImageSlider(),
                    SizedBox(
                      height: 20,
                    ),
                    ItemcardHeading("Exclusive Offer"),
                    SizedBox(
                      height: 15,
                    ),
                    ItemCard(_products),
                    SizedBox(
                      height: 20,
                    ),
                    ItemcardHeading("Best Selling"),
                    SizedBox(
                      height: 15,
                    ),
                    ItemCard(_bestSelling),
                    SizedBox(
                      height: 20,
                    ),
                    ItemcardHeading("Groceries"),
                    SizedBox(
                      height: 20,
                    ),
                    Category(_category),
                    SizedBox(
                      height: 10,
                    ),
                    ItemCard(_groceries),
                  ],
                ),
              if (_searchController.text.length != 0)
                Container(
                  margin: EdgeInsets.only(right: 20, bottom: 20),
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (ctx, index) {
                      return CategoryCardList(productList[index]);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
