///
/// Created by Abduraimbek Yarkinov at 16:10 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 4.69.vertical,
      child: Center(
        child: Text(
          "QUOTE DETAILS",
          style: MyTextStyles.interMediumFirst(
            fontSize: 3.8,
            color: MyColors.redColor,
          ),
        ),
      ),
    );
  }
}
