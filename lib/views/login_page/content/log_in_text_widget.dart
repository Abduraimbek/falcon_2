///
/// Created by Abduraimbek Yarkinov at 12:49 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class LogInTextWidget extends StatelessWidget {
  const LogInTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Log in",
      style: MyTextStyles.interMediumFirst(
        color: MyColors.bigTextColor,
        fontSize: 8,
      ),
    );
  }
}
