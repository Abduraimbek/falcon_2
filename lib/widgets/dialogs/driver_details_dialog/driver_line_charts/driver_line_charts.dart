///
/// Created by Abduraimbek Yarkinov at 18:33 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'build_item.dart';
import 'package:falcon_2/utils/utils.dart';

class DriverLineCharts extends StatelessWidget {
  const DriverLineCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: const [
          BuildItem(
            color: MyColors.redColor,
            svgPath: "assets/svg2/cube.svg",
            label: "TOTAL SHIPMENTS",
            numberLabel: "164",
          ),
          SizedBox(width: 6),
          BuildItem(
            color: Color(0xff30ea43),
            svgPath: "assets/svg2/timer.svg",
            label: "TOTAL HOURS",
            numberLabel: "724",
          ),
          SizedBox(width: 6),
          BuildItem(
            color: Color(0xffffb800),
            svgPath: "assets/svg2/routing.svg",
            label: "TOTAL MILES",
            numberLabel: "186K",
          ),
          SizedBox(width: 6),
          BuildItem(
            color: Color(0xff8000ff),
            svgPath: "assets/svg2/money_receive.svg",
            label: "TOTAL EARNINGS",
            numberLabel: "1.2M",
          ),
        ],
      ),
    );
  }
}
