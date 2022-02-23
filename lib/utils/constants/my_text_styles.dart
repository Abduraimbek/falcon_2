///
/// Created by Abduraimbek Yarkinov at 11:59 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class MyTextStyles {
  static TextStyle interRegularFirst({
    double fontSize = 4,
    Color color = MyColors.firstTextColor,
  }) {
    return TextStyle(
      fontFamily: "InterRegular",
      fontSize: fontSize.sp,
      color: color,
    );
  }

  static TextStyle interMediumFirst({
    double fontSize = 4,
    Color color = MyColors.firstTextColor,
    bool isBold = false,
  }) {
    return TextStyle(
      fontFamily: isBold ? "InterExtraBold" : "InterMedium",
      fontSize: fontSize.sp,
      color: color,
    );
  }

  static TextStyle interRegularSecond({
    double fontSize = 4,
    Color color = MyColors.secondTextColor,
  }) {
    return TextStyle(
      fontFamily: "InterRegular",
      fontSize: fontSize.sp,
      color: color,
    );
  }

  static TextStyle interMediumSecond({
    double fontSize = 4,
    Color color = MyColors.secondTextColor,
  }) {
    return TextStyle(
      fontFamily: "InterMedium",
      fontSize: fontSize.sp,
      color: color,
    );
  }

  static TextStyle interRegularTens({
    double fontSize = 4,
    Color color = MyColors.tensTextColor,
  }) {
    return TextStyle(
      fontFamily: "InterRegular",
      fontSize: fontSize.sp,
      color: color,
    );
  }

  static TextStyle interMediumTens({
    double fontSize = 4,
    Color color = MyColors.tensTextColor,
  }) {
    return TextStyle(
      fontFamily: "InterMedium",
      fontSize: fontSize.sp,
      color: color,
    );
  }
}
