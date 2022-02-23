///
/// Created by Abduraimbek Yarkinov at 19:20 on 05.01.2022.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildSwitch extends StatelessWidget {
  const BuildSwitch({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.text,
  }) : super(key: key);

  final Function(bool) onChanged;
  final bool value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: MyTextStyles.interMediumFirst(),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
