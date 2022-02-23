///
/// Created by Abduraimbek Yarkinov at 16:12 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyButtonWithSvg extends StatelessWidget {
  const MyButtonWithSvg({
    Key? key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.svgPath,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color color;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 3.42.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    svgPath,
                    fit: BoxFit.cover,
                    color: Colors.white,
                    width: 1.27.vertical,
                    height: 1.27.vertical,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: MyTextStyles.interMediumFirst(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
