///
/// Created by Abduraimbek Yarkinov at 17:29 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildLocationUpdated extends StatelessWidget {
  const BuildLocationUpdated({
    Key? key,
    required this.text1,
    required this.text2,
    required this.child,
  }) : super(key: key);

  final String text1;
  final String text2;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interRegularTens(
      color: MyColors.backgroundColor,
      fontSize: 3.95,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text1, style: style),
        const SizedBox(width: 10),
        SvgPicture.asset(
          "assets/svg3/information.svg",
          fit: BoxFit.cover,
          width: 2.vertical,
          height: 2.vertical,
        ),
        const SizedBox(width: 25),
        Text(text2, style: style),
        const SizedBox(width: 30),
        child,
      ],
    );
  }
}
