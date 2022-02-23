///
/// Created by Abduraimbek Yarkinov at 10:55 on 07.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PickUpAndDelivery extends StatelessWidget {
  const PickUpAndDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPickUp(),
        const SizedBox(height: 35),
        buildDelivery(),
        const SizedBox(height: 25),
        buildInfo(),
      ],
    );
  }

  Widget buildPickUp() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 2.1.vertical,
          width: 2.1.vertical,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.redColor,
          ),
          child: Center(
            child: Text(
              "1",
              style: MyTextStyles.interMediumFirst(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Pick-up",
          style: MyTextStyles.interMediumFirst(
            color: MyColors.backgroundColor,
          ),
        ),
        const SizedBox(width: 7),
        SvgPicture.asset(
          "assets/svg3/information.svg",
          fit: BoxFit.cover,
          height: 2.3.vertical,
          width: 2.3.vertical,
        ),
      ],
    );
  }

  Widget buildDelivery() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 2.1.vertical,
          width: 2.1.vertical,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff656565),
          ),
          child: Center(
            child: Text(
              "2",
              style: MyTextStyles.interMediumFirst(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Pick-up",
          style: MyTextStyles.interMediumFirst(
            color: const Color(0xff656565),
          ),
        ),
      ],
    );
  }

  Widget buildInfo() {
    final style1 = MyTextStyles.interMediumFirst(
      color: const Color(0xff656565),
      fontSize: 3.8,
    );

    final style2 = MyTextStyles.interRegularFirst(
      color: const Color(0xff8c91a5),
      fontSize: 3.8,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Company",
              style: style1,
            ),
            const SizedBox(height: 5),
            Text(
              "Address",
              style: style1,
            ),
            const SizedBox(height: 5),
            Text(
              "Scheduled",
              style: style1,
            ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "N/A",
              style: style2,
            ),
            const SizedBox(height: 5),
            Text(
              "800 Prudential Dr, Jacksonville, FL 32207, US",
              style: style2,
            ),
            const SizedBox(height: 5),
            Text(
              "02/11/2021 08:00 (UTC-04:00)",
              style: style2,
            ),
          ],
        ),
      ],
    );
  }
}
