import 'package:GroceryMart/widgets/FilterScreenWidgets/CheckItem.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "Filter";
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isEggs = true;
  var isPast = false;
  var isChips = false;
  var isFastFood = false;
  var isIndividualCollection = false;
  var isCocola = true;
  var isIfad = false;
  var isKaziFarmas = false;
  void onSubmit() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Filters"),
        leading: IconButton(
          icon: Image.asset(
            "assets/images/cross.png",
            height: 18,
            width: 18,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: new Color(0xffF2F3F2),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CheckItem(isEggs, "Eggs"),
            SizedBox(
              height: 20,
            ),
            CheckItem(isPast, "Noodles & Pasta"),
            SizedBox(
              height: 20,
            ),
            CheckItem(isChips, "Chips & Crisps"),
            SizedBox(
              height: 20,
            ),
            CheckItem(isFastFood, "Fast Food"),
            SizedBox(
              height: 25,
            ),
            Text(
              "Brand",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CheckItem(isIndividualCollection, "Individual Callection"),
            SizedBox(
              height: 20,
            ),
            CheckItem(isCocola, "Cocola"),
            SizedBox(
              height: 20,
            ),
            CheckItem(isIfad, "Ifad"),
            SizedBox(
              height: 20,
            ),
            CheckItem(isKaziFarmas, "Kazi Farmas"),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: RaisedButton(
                  onPressed: onSubmit,
                  child: Text(
                    'Apply Filter',
                    style: TextStyle(
                      fontFamily: 'PTSansCaption',
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
