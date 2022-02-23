///
/// Created by Abduraimbek Yarkinov at 13:07 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'top/top.dart';
import 'package:falcon_2/utils/utils.dart';
import 'driver_customer_and_buttons/driver_customer_and_buttons.dart';
import 'current_status/current_status.dart';
import 'show_route/show_route.dart';
import 'build_map/build_map.dart';
import 'location_and_cargo/location_and_cargo.dart';

class ActiveShipments extends StatelessWidget {
  const ActiveShipments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Top(),
        Container(
          width: double.infinity,
          height: 1,
          color: MyColors.thirdTextColor,
        ),
        const SizedBox(height: 15),
        const DriverCustomerAndButtons(),
        const CurrentStatus(),
        Expanded(
          flex: 3,
          child: Row(
            children: const [
              Expanded(
                child: LocationAndCargo(),
              ),
              Expanded(
                child: BuildMap(),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 1,
          child: ShowRoute(),
        ),
      ],
    );
  }
}
