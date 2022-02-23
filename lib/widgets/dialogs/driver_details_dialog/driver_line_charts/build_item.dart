///
/// Created by Abduraimbek Yarkinov at 18:36 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.color,
    required this.svgPath,
    required this.label,
    required this.numberLabel,
  }) : super(key: key);

  final Color color;
  final String svgPath;
  final String label;
  final String numberLabel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 12.3.vertical,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: MyColors.myShadow,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          label,
                          style: MyTextStyles.interMediumFirst(fontSize: 3.9),
                        ),
                        Text(
                          numberLabel,
                          style: MyTextStyles.interMediumFirst(fontSize: 6.5),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      svgPath,
                      color: color,
                      height: 2.34.vertical,
                      width: 2.34.vertical,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SfCartesianChart(
                  primaryXAxis: nullAxis(),
                  primaryYAxis: nullAxis(),
                  borderWidth: 0,
                  plotAreaBorderWidth: 0,
                  borderColor: Colors.transparent,
                  plotAreaBorderColor: Colors.transparent,
                  margin: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  series: _getSplineAreaSeries(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  NumericAxis nullAxis() => NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
        rangePadding: ChartRangePadding.none,
        isVisible: false,
      );

  List<ChartSeries<_SplineAreaData, double>> _getSplineAreaSeries() {
    final List<_SplineAreaData> chartData = <_SplineAreaData>[
      _SplineAreaData(2010, 3, 3),
      _SplineAreaData(2011, 5, 5),
      _SplineAreaData(2012, 4, 4),
      _SplineAreaData(2013, 6, 6),
      _SplineAreaData(2014, 5, 5),
      _SplineAreaData(2015, 7, 7),
      _SplineAreaData(2016, 8, 8),
      _SplineAreaData(2017, 5, 5),
      _SplineAreaData(2018, 9, 9),
    ];
    return <ChartSeries<_SplineAreaData, double>>[
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData,
        borderColor: color.withOpacity(.05),
        color: color.withOpacity(.2),
        borderWidth: 2,
        name: 'China',
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y2,
      )
    ];
  }
}

class _SplineAreaData {
  _SplineAreaData(this.year, this.y1, this.y2);

  final double year;
  final double y1;
  final double y2;
}
