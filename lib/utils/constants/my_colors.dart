///
/// Created by Abduraimbek Yarkinov at 11:40 on 16.11.2021.
///

import 'package:flutter/material.dart';

class MyColors {
  static const backgroundColor = Color(0xff1a234c);
  static const cardColor = Color(0xffffffff);
  static const redColor = Color(0xffff0000);
  static const orangeColor = Color(0xfffd5b04);
  static const blueColor = Color(0xff0038ff);
  static const greenColor = Color(0xff00ff0a);

  static final selectedDrawerItemColor =
      const Color(0xffffffff).withOpacity(.3);
  static final drawerTextColor = const Color(0xffffffff).withOpacity(.5);
  static final drawerHeaderColor = const Color(0xffffffff).withOpacity(.8);

  static const bigTextColor = Color(0xff303030);
  static const firstTextColor = Color(0xff000000);
  static const secondTextColor = Color(0xff979797);
  static const thirdTextColor = Color(0xffbababa);
  static const tensTextColor = Color(0xff303030);

  static final myShadow = [
    BoxShadow(
      color: const Color(0xff000000).withOpacity(.15),
      offset: const Offset(2, 2),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];
}
