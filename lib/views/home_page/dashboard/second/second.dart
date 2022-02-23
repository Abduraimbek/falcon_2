///
/// Created by Abduraimbek Yarkinov at 5:43 PM on 11/26/2021.
///

import 'package:flutter/material.dart';
import 'left/left.dart';
import 'right/right.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 3,
          child: Left(),
        ),
        SizedBox(width: 15),
        Expanded(
          flex: 1,
          child: Right(),
        ),
      ],
    );
  }
}
