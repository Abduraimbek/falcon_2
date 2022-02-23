///
/// Created by Abduraimbek Yarkinov at 16:10 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class MyButtonView extends StatelessWidget {
  const MyButtonView({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          hoverColor: MyColors.redColor.withOpacity(.1),
          focusColor: MyColors.redColor.withOpacity(.1),
          splashColor: MyColors.redColor.withOpacity(.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
