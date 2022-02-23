///
/// Created by Abduraimbek Yarkinov at 12:42 on 04.12.2021.
///

import 'package:flutter/material.dart';
import 'build_check_box.dart';
import 'build_button.dart';

class BuildButtons extends StatelessWidget {
  const BuildButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        BuildCheckBox(),
        BuildButton(),
      ],
    );
  }
}
