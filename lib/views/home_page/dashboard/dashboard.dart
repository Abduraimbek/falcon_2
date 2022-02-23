///
/// Created by Abduraimbek Yarkinov at 19:15 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'first/first.dart';
import 'second/second.dart';
import 'third/third.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Top(),
        Container(
          width: double.infinity,
          height: 1,
          color: MyColors.thirdTextColor,
        ),
        const SizedBox(height: 15),
        const Expanded(flex: 1, child: First()),
        const SizedBox(height: 15),
        const Expanded(flex: 2, child: Second()),
        const SizedBox(height: 15),
        const Expanded(flex: 1, child: Third()),
        const SizedBox(height: 70),
      ],
    );
  }
}
