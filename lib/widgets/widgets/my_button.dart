///
/// Created by Abduraimbek Yarkinov at 11:15 on 20.11.2021.
///
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
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
        color: color,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 3.42.vertical,
            width: 11.72.vertical,
            child: Center(
              child: Text(
                text,
                style: MyTextStyles.interMediumFirst(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
