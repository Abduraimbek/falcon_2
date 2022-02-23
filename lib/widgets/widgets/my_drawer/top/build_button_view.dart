///
/// Created by Abduraimbek Yarkinov at 16:47 on 07.12.2021.
///

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildButtonView extends StatelessWidget {
  const BuildButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = MyPrefsFields.employeeName;

    return SizedBox(
      height: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          SvgPicture.asset(
            "assets/svg_drawer/drawer_settings.svg",
            fit: BoxFit.cover,
            height: 2.15.vertical,
            width: 2.15.vertical,
            color: MyColors.drawerHeaderColor,
          ),
          const SizedBox(width: 17),
          Text(
            name,
            style: MyTextStyles.interMediumFirst(
              color: MyColors.drawerHeaderColor,
            ),
          ),
          const SizedBox(width: 20),
          SvgPicture.asset(
            "assets/svg_drawer/drawer_down.svg",
            fit: BoxFit.cover,
            height: .82.vertical,
            width: .82.vertical,
            color: MyColors.drawerHeaderColor,
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
