import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrontEndConfigs {
  static const List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Color(0x29000000),
    ),
    BoxShadow(
      offset: Offset(0, 3),
      color: Colors.white,
      spreadRadius: 1,
      blurRadius: 5.0,
    ),
  ];

  static const Color kPrimaryColor = Color(0xffFEB400);
}
