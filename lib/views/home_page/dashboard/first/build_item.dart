///
/// Created by Abduraimbek Yarkinov at 10:58 on 23.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.label,
    required this.percent,
    required this.current,
    required this.previous,
    required this.isMoney,
    required this.isIncrease,
  }) : super(key: key);

  final String label;
  final double percent;
  final double current;
  final double previous;
  final bool isMoney;
  final bool isIncrease;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xfff4f4f4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            buildTop(),
            const Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: buildBottom(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: MyTextStyles.interMediumFirst(),
        ),
        const Spacer(),
        Text(
          "$percent%",
          textAlign: TextAlign.center,
          style: MyTextStyles.interMediumFirst(fontSize: 9),
        ),
        const SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: SvgPicture.asset(
            isIncrease ? "assets/svg1/up.svg" : "assets/svg1/down.svg",
            color: isIncrease ? MyColors.greenColor : MyColors.redColor,
            fit: BoxFit.cover,
            width: .7.vertical,
            height: .7.vertical,
          ),
        ),
      ],
    );
  }

  Widget buildBottom() {
    final style = MyTextStyles.interMediumFirst();
    final style2 = MyTextStyles.interRegularFirst();

    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40)
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current", style: style),
            Text(_getString(current), style: style2),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: SfSparkLineChart.custom(
            //Enable the trackball
            trackball: const SparkChartTrackball(
              activationMode: SparkChartActivationMode.tap,
            ),
            labelDisplayMode: SparkChartLabelDisplayMode.all,
            xValueMapper: (int index) => data[index].year,
            yValueMapper: (int index) => data[index].sales,
            dataCount: 5,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Previous", style: style),
            Text(_getString(previous), style: style2),
          ],
        ),
      ],
    );
  }

  String _getString(double d) {
    if (isMoney) {
      return r"$" + MyStringHelper.moneyFormat(d);
    } else {
      return d.round().toString();
    }
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
