///
/// Created by Abduraimbek Yarkinov at 5:47 PM on 11/26/2021.
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Left extends StatelessWidget {
  const Left({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [
        const Color(0xff1a234c).withOpacity(.58),
        const Color(0xff1a234c),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    var data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14),
      _ChartData("Abduraimbek", 20),
      _ChartData("Yarkinov", 17),
      _ChartData("Shavkatbek o'g'li", 19.3),
      _ChartData("Mark", 16),
      _ChartData("Zuckerberg", 33),
      _ChartData("Pavel", 29),
    ];
    var _tooltip = TooltipBehavior(enable: true);

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xfff4f4f4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Gold',
                gradient: gradient,
              )
            ]),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
