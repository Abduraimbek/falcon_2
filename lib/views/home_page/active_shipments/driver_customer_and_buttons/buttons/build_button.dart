///
/// Created by Abduraimbek Yarkinov at 15:49 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:falcon_2/widgets/widgets.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key,
    required this.svgPath,
    required this.label,
  }) : super(key: key);

  final String svgPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MyButtonView(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            color: MyColors.redColor,
            width: 2.0.vertical,
            height: 2.0.vertical,
            fit: BoxFit.cover,
          ),
          Text(
            "  $label",
            style: MyTextStyles.interMediumFirst(
              color: MyColors.redColor,
              fontSize: 3.8,
            ),
          ),
        ],
      ),
    );
  }
}
