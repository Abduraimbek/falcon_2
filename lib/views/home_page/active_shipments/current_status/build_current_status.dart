///
/// Created by Abduraimbek Yarkinov at 17:23 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildCurrentStatus extends StatelessWidget {
  const BuildCurrentStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Current Status        ",
          style: MyTextStyles.interMediumFirst(
            color: MyColors.backgroundColor,
            fontSize: 3.8,
          ),
        ),
        Text(
          "Loaded at Pick-up",
          style: MyTextStyles.interRegularTens(
            color: MyColors.backgroundColor,
            fontSize: 3.8,
          ),
        )
      ],
    );
  }
}
