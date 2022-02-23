///
/// Created by Abduraimbek Yarkinov at 17:37 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/svg3/location_tick.svg",
            color: MyColors.redColor,
            fit: BoxFit.cover,
            width: 2.vertical,
            height: 2.vertical,
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            "assets/svg2/pencil.svg",
            color: MyColors.redColor,
            fit: BoxFit.cover,
            width: 2.vertical,
            height: 2.vertical,
          ),
        ],
      ),
    );
  }
}
