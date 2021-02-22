import 'package:flutter/material.dart';
import '../screens/HomeSceen.dart';
import '../screens/SearchTab.dart';
import '../screens/CartScreen.dart';
import '../screens/FavouriteScreen.dart';
import '../screens/Profile.dart';

class TabBarScreen extends StatefulWidget {
  static String routeName = 'TabBarScreen';
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Map<String, Object>> _pages;
  var selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        "page": HomeScreen(),
        "title": 'Home',
      },
      {
        "page": SearchTab(),
        "title": 'Search',
      },
      {
        "page": CartScreen(),
        "title": 'Cart',
      },
      {
        "page": FavouriteScreen(),
        "title": 'Favourite',
      },
      {
        "page": Profile(),
        "title": 'Profile',
      },
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        unselectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(color: Colors.black),
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedPageIndex == 0
                  ? 'assets/images/ShopColor.png'
                  : "assets/images/ShopIcon.png",
              height: 20,
              width: 20,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedPageIndex == 1
                  ? "assets/images/SearchTabColor.png"
                  : "assets/images/SearchTabIcon.png",
              height: 20,
              width: 20,
            ),
            label: "Expolre",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedPageIndex == 2
                  ? "assets/images/CartColor.png"
                  : "assets/images/CartIcon.png",
              height: 20,
              width: 20,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedPageIndex == 3
                  ? "assets/images/FavouriteColor.png"
                  : "assets/images/Favourite.png",
              height: 20,
              width: 20,
            ),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedPageIndex == 4
                  ? "assets/images/UserColorIcon.png"
                  : "assets/images/UserTab.png",
              height: 20,
              width: 20,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
