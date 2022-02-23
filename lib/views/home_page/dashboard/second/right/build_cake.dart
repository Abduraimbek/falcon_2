///
/// Created by Abduraimbek Yarkinov at 6:51 PM on 11/26/2021.
///

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildCake extends StatelessWidget {
  const BuildCake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_ChartData> chartData = [
      _ChartData('David', 70, const Color(0xff001881)),
      _ChartData('Steve', 20, const Color(0xffff9900)),
      _ChartData('Jack', 7, const Color(0xffff7474)),
      _ChartData('Others', 3, const Color(0xffcc00ff)),
      _ChartData('Hello world', 25, Colors.yellow),
    ];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "     TOP BROKERS",
            style: MyTextStyles.interRegularFirst(),
          ),
          Expanded(
            child: SfCircularChart(
              series: <CircularSeries>[
                // Render pie chart
                PieSeries<_ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (_ChartData data, _) => data.color,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y)
              ],
            ),
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
