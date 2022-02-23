///
/// Created by Abduraimbek Yarkinov at 11:23 on 16.11.2021.
///

import 'dart:math' show pow, sqrt;

class SizeConfig {
  static late double horizontal;
  static late double vertical;
  static late double sp;
  static late double diagonal;

  void initWidthAndHeight(double width, double height) {
    horizontal = width / 100;
    vertical = height / 100;
    sp = height / 300;
    diagonal = sqrt((pow(width, 2) + pow(height, 2))) / 100;
  }
}

extension SizeConfigExtension on num {
  double get horizontal => this * SizeConfig.horizontal;

  double get vertical => this * SizeConfig.vertical;

  double get sp => this * SizeConfig.sp;

  double get diagonal => this * SizeConfig.diagonal;
}
