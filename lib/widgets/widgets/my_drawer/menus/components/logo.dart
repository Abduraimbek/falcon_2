///
/// Created by Abduraimbek Yarkinov at 15:03 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg1/logo.svg",
            width: 4.1.vertical,
            height: 4.1.vertical,
            fit: BoxFit.cover,
          ),
          Text(
            MyStrings.falconGroupLLC,
            style: MyTextStyles.interMediumFirst(
              color: MyColors.redColor,
              fontSize: 5.5,
            ),
          ),
        ],
      ),
    );
  }
}
