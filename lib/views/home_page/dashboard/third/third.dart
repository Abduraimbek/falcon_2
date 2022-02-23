///
/// Created by Abduraimbek Yarkinov at 10:54 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'build_item.dart';

class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 15),
        BuildItem(
          label: "TOTAL SHIPMENTS",
          percent: 50,
          current: 3,
          previous: 2,
          isMoney: false,
          isIncrease: true,
          flex: 2,
        ),
        SizedBox(width: 15),
        BuildItem(
          label: "AVERAGE PRICE(MI)",
          percent: 8,
          current: 175,
          previous: 168,
          isMoney: true,
          isIncrease: true,
          flex: 1,
        ),
        SizedBox(width: 15),
        BuildItem(
          label: "TOP LOAD COORDINATOR",
          percent: 32,
          current: 5075,
          previous: 7800,
          isMoney: true,
          isIncrease: true,
          flex: 1,
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
