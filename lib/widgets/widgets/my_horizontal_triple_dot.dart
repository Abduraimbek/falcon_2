///
/// Created by Abduraimbek Yarkinov at 11:15 on 29.11.2021.
///

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHorizontalTripleDot extends StatelessWidget {
  const MyHorizontalTripleDot({
    Key? key,
    required this.color,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg2/circle.svg",
            fit: BoxFit.cover,
            width: 4,
            height: 4,
            color: color,
          ),
          const SizedBox(width: 4),
          SvgPicture.asset(
            "assets/svg2/circle.svg",
            fit: BoxFit.cover,
            width: 4,
            height: 4,
            color: color,
          ),
          const SizedBox(width: 4),
          SvgPicture.asset(
            "assets/svg2/circle.svg",
            fit: BoxFit.cover,
            width: 4,
            height: 4,
            color: color,
          ),
        ],
      ),
    );
  }
}
