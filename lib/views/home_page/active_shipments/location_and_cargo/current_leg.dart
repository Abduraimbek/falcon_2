///
/// Created by Abduraimbek Yarkinov at 18:49 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class CurrentLeg extends StatelessWidget {
  const CurrentLeg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildItem(
          "Current leg:  ",
          "1 of 2     ",
        ),
        buildItem(
          "Total Cargo:  ",
          "5 pc, 2000 lb     ",
        ),
        buildItem(
          "Loaded miles:  ",
          "26950",
        ),
      ],
    );
  }

  Widget buildItem(String text1, String text2) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text1,
          style: MyTextStyles.interMediumFirst(
            color: MyColors.backgroundColor,
            fontSize: 3.6,
          ),
        ),
        Text(
          text2,
          style: MyTextStyles.interRegularTens(
            color: MyColors.backgroundColor,
            fontSize: 3.6,
          ),
        )
      ],
    );
  }
}
