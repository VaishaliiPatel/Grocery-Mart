import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatelessWidget {
  final items = [
    'assets/images/banner1.png',
    'assets/images/carrotColorIcon.png',
    'assets/images/banner1.png',
    'assets/images/background.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: CarouselSlider(
      //   // carouselController: true,
      //   items: items
      //       .map((e) => Builder(builder: (BuildContext contex) {
      //             return Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 color: Colors.white,
      //               ),
      //               width: double.infinity,
      //               child: GestureDetector(
      //                 child: Image.asset(
      //                   e,
      //                   fit: BoxFit.fill,
      //                 ),
      //                 onTap: () {},
      //               ),
      //             );
      //           }))
      //       .toList(),
      //   options: CarouselOptions(
      //     height: 150,
      //   ),
      // ),
      child: Image.asset('assets/images/banner1.png'),
      // height: 180,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
    );
  }
}
