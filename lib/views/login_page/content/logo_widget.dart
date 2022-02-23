///
/// Created by Abduraimbek Yarkinov at 12:39 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svg1/logo.svg",
          width: 4.vertical,
          height: 4.vertical,
        ),
        const SizedBox(width: 10),
        Text(
          MyStrings.falconGroupLLC,
          style: MyTextStyles.interMediumFirst(
            color: MyColors.redColor,
            fontSize: 5.3,
          ),
        ),
      ],
    );
  }
}
