///
/// Created by Abduraimbek Yarkinov at 15:19 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'driver_customer/driver_customer.dart';
import 'buttons/buttons.dart';

class DriverCustomerAndButtons extends StatelessWidget {
  const DriverCustomerAndButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          DriverCustomer(),
          Buttons(),
        ],
      ),
    );
  }
}
