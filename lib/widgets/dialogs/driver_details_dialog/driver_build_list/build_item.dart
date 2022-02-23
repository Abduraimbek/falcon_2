///
/// Created by Abduraimbek Yarkinov at 10:34 on 29.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/widgets.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.style1,
    required this.style2,
    required this.style3,
  }) : super(key: key);

  final TextStyle style1;
  final TextStyle style2;
  final TextStyle style3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 5.86.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 25, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text("#456149", style: style1),
            ),
            Expanded(
              flex: 2,
              child: Text("AMAZON AWS", style: style2),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Dallas, TX", style: style2),
                  Text("WED 10/13 03:00-10:00 CDT", style: style3),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Gretna, LA", style: style2),
                  Text("FRI 10/16 19:00-SAT 10/17 10:00 CDT", style: style3),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text("1,522 mi", style: style2),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("3,450 lb", style: style2),
                  MyHorizontalTripleDot(
                    onTap: () {},
                    color: MyColors.thirdTextColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
