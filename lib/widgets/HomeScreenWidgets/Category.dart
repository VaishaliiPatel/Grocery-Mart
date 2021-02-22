import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  List category;

  Category(this.category);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: category.map(
          (e) {
            return Container(
              height: 100,
              width: 240,
              margin: EdgeInsets.only(right: 15, bottom: 5),
              decoration: BoxDecoration(
                color: e['color'],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset(
                        e['imagePath'],
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      e['name'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
