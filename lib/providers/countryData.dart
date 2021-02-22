import 'package:flutter/material.dart';
import 'dart:convert';

class Country {
  final String name;
  final String imageURL;
  final List<String> code;

  Country({this.name, this.imageURL, this.code});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      imageURL: json['flag'],
      code: json['callingCodes'].cast<String>(),
    );
  }
}
