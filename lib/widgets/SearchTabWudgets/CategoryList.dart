import 'dart:math';

import 'package:GroceryMart/screens/CategoryScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../models/Category.dart';

class CategoryList extends StatelessWidget {
  Color _borderColor;
  Color _bgcolor;
  List<Category> _category;

  CategoryList(this._category);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      margin: EdgeInsets.only(
        right: 20,
      ),
      // height: MediaQuery.of(context).size.height * 0.65,
      child: GridView.builder(
          itemCount: _category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (ctx, index) {
            _borderColor =
                Colors.primaries[Random().nextInt(Colors.primaries.length)];
            _bgcolor = _borderColor.withOpacity(0.2);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  CategoryScreen.routeNmae,
                  arguments: _category[index].name,
                );
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: 30,
                  left: 15,
                  right: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: _borderColor,
                  ),
                  color: _bgcolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      _category[index].imagePath,
                      height: 80,
                      width: 110,
                    ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          _category[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
