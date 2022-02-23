///
/// Created by Abduraimbek Yarkinov at 6:52 PM on 11/26/2021.
///

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildInfo extends StatelessWidget {
  const BuildInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_ChartData> chartData = [
      _ChartData('David', 45, const Color(0xff001881)),
      _ChartData('Steve', 20, const Color(0xffff9900)),
      _ChartData('Jack', 7, const Color(0xffff7474)),
      _ChartData('Others', 3, const Color(0xffcc00ff)),
      _ChartData('Hello world', 25, Colors.yellow),
    ];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: chartData
              .map((e) => buildItem(
                    color: e.color,
                    label: e.x,
                    percent: e.y,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget buildItem({
    required Color color,
    required String label,
    required double percent,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg2/rhombus.svg",
            color: color,
            width: 1.37.vertical,
            height: 1.37.vertical,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 15),
          Text(
            label,
            style: MyTextStyles.interRegularFirst(),
          ),
          const Spacer(),
          Text(
            "$percent%",
            style: MyTextStyles.interRegularFirst(),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
