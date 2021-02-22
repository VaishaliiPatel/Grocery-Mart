import 'package:provider/provider.dart';
import '../models/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/FilterScreen.dart';
import '../widgets/SearchTabWudgets/CategoryList.dart';
import '../providers/productProviders.dart';
import '../models/Product.dart';
import '../widgets/CategoryWidgets/CategoryCardList.dart';

class SearchTab extends StatefulWidget {
  static String routeName = "SearchTab";
  @override
  _SearchTabState createState() => _SearchTabState();
}

List<Category> _category = [
  Category(
      name: "Frash Fruits & Vegetable", imagePath: 'assets/images/Fresh.png'),
  Category(name: "Cooking Oil & Ghee", imagePath: 'assets/images/oil.png'),
  Category(name: "Meat & Fish", imagePath: 'assets/images/meat.png'),
  Category(name: "Bakery & Snacks", imagePath: 'assets/images/bakery.png'),
  Category(name: "Dairy & Eggs", imagePath: 'assets/images/EggsAndMilk.png'),
  Category(name: "Beverages", imagePath: 'assets/images/beverages.png'),
  Category(
      name: "Fresh Fruits & Vegetable", imagePath: 'assets/images/Fresh.png'),
  Category(name: "Cooking Oil & Ghee", imagePath: 'assets/images/oil.png'),
  Category(name: "Meat & Fish", imagePath: 'assets/images/meat.png'),
];

class _SearchTabState extends State<SearchTab> {
  final _searchController = TextEditingController();
  List<Product> productList = [];

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
      alignment: Alignment.center,
      width: _searchController.text.length == 0
          ? MediaQuery.of(context).size.width - 40
          : (MediaQuery.of(context).size.width - 40) * 0.9,
      height: 50,
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
        right: _searchController.text.length == 0 ? 15 : 0,
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
        ),
        onChanged: (value) => onSearchhText(value),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Products",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'PTSansCaption',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.95,
        margin: EdgeInsets.only(
          left: 20,
          // bottom: 20,
          // right: 20,
        ),
        child: Column(
          children: [
            if (_searchController.text.length == 0 ||
                _searchController.text.isEmpty)
              searchBar,
            if (_searchController.text.length != 0 ||
                _searchController.text.isNotEmpty)
              Row(
                children: [
                  searchBar,
                  Container(
                    child: IconButton(
                        icon: Image.asset(
                          "assets/images/filter.png",
                          height: 20,
                          width: 20,
                        ),
                        onPressed: () {
                          print("SearchTab");
                          Navigator.of(context)
                              .pushNamed(FilterScreen.routeName);
                        }),
                  )
                ],
              ),
            if (_searchController.text.length == 0)
              Expanded(
                child: CategoryList(_category),
              ),
            if (_searchController.text.length != 0 && productList.length == 0)
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: Text(
                    "No item found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'PTSansCaption',
                    ),
                  ),
                ),
              ),
            if (_searchController.text.length != 0)
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 20,
                  ),
                  // height: MediaQuery.of(context).size.height * 0.7,
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
              ),
          ],
        ),
      ),
    );
  }
}
