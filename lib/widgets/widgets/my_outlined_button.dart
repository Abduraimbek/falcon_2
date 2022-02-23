///
/// Created by Abduraimbek Yarkinov at 11:14 on 20.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 3.42.vertical,
            width: 11.72.vertical,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: color),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                text,
                style: MyTextStyles.interMediumFirst(color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
