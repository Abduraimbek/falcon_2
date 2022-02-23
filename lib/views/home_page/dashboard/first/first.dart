///
/// Created by Abduraimbek Yarkinov at 10:57 on 23.11.2021.
///

import 'package:flutter/material.dart';
import 'build_item.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

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
        ),
        SizedBox(width: 15),
        BuildItem(
          label: "TOTAL GROSS",
          percent: 32,
          current: 5064,
          previous: 6003,
          isMoney: true,
          isIncrease: true,
        ),
        SizedBox(width: 15),
        BuildItem(
          label: "AVERAGE PRICE(MI)",
          percent: 8,
          current: 2000,
          previous: 10000,
          isMoney: true,
          isIncrease: true,
        ),
        SizedBox(width: 15),
        BuildItem(
          label: "TOP LOAD COORDINATOR",
          percent: 32,
          current: 2342,
          previous: 2345,
          isMoney: true,
          isIncrease: true,
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
