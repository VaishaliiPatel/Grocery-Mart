import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/productProviders.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child:
          // TextField(
          //   onChanged: (value) {
          //     setState(() {
          //       searchText.text = value;
          //     });
          //     print('----------------value-----');
          //     print(value);
          //     Provider.of<Productprovider>(context).searchItem(value);
          //   },
          //   autofocus: true,
          //   controller: searchText,
          //   textDirection: TextDirection.ltr,
          //   decoration: InputDecoration(
          //     hintText: 'Search Store',
          //     icon: Container(
          //       padding: EdgeInsets.only(
          //         top: 13,
          //         bottom: 13,
          //         left: 13,
          //       ),
          //       child: Image.asset(
          //         'assets/images/SearchIcon.png',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     border: InputBorder.none,
          //   ),
          // style: TextStyle(
          //   decoration: TextDecoration.none,
          //   fontSize: 14,
          //   // color: Colors.grey,
          // ),
          // ),
          TextField(
        textAlignVertical: TextAlignVertical(y: 0.5),
        controller: searchText,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Search Store',
          border: InputBorder.none,
          prefixIcon: Container(
            margin: const EdgeInsets.only(
              top: 13,
              bottom: 13,
              left: 13,
              right: 13,
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
        onChanged: (value) {
          print('----------------value-----');
          print(value);
        },
      ),
    );
  }
}
