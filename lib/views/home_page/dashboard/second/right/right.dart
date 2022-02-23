///
/// Created by Abduraimbek Yarkinov at 5:47 PM on 11/26/2021.
///

import 'package:flutter/material.dart';
import 'build_cake.dart';
import 'build_info.dart';

class Right extends StatelessWidget {
  const Right({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xfff4f4f4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: const [
            Expanded(
              flex: 10,
              child: BuildCake(),
            ),
            Expanded(
              flex: 8,
              child: BuildInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
