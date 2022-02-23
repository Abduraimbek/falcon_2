///
/// Created by Abduraimbek Yarkinov at 15:21 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'build_driver.dart';
import 'build_customer.dart';

class DriverCustomer extends StatelessWidget {
  const DriverCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SHIPMENT DETAILS",
          style: MyTextStyles.interMediumFirst(
            color: const Color(0xff8c91a5),
          ),
        ),
        const SizedBox(height: 20),
        const BuildDriver(),
        const BuildCustomer(),
      ],
    );
  }
}
