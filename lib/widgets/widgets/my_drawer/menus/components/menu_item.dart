///
/// Created by Abduraimbek Yarkinov at 16:01 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.isSelected,
    required this.svgPath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String svgPath;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final labelColor = isSelected ? Colors.white : MyColors.drawerTextColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 4.1.vertical,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: isSelected
                ? MyColors.selectedDrawerItemColor
                : Colors.transparent,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              SvgPicture.asset(
                svgPath,
                color: labelColor,
                width: 1.76.vertical,
                height: 1.76.vertical,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: MyTextStyles.interRegularSecond(color: labelColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
