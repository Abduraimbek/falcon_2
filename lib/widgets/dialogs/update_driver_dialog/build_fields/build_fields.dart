///
/// Created by Abduraimbek Yarkinov at 17:46 on 03.12.2021.
///

import 'package:flutter/material.dart';
import 'left.dart';
import 'right.dart';

class BuildFields extends StatelessWidget {
  const BuildFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Left(),
        Right(),
        SizedBox(width: 50),
      ],
    );
  }
}
