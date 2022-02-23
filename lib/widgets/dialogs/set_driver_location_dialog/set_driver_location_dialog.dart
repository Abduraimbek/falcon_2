///
/// Created by Abduraimbek Yarkinov at 19:57 on 04.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'top/top.dart';
import 'package:falcon_2/utils/utils.dart';
import 'set_location_web_view.dart';

Future<void> showSetDriverLocationDialog({
  required BuildContext context,
  required DriverModel driver,
}) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _SetDriverLocationDialog(
        driver: driver,
      ),
    ),
  );

  DriverSingleton.getDrivers();
}

class _SetDriverLocationDialog extends StatelessWidget {
  const _SetDriverLocationDialog({
    Key? key,
    required this.driver,
  }) : super(key: key);

  final DriverModel driver;

  @override
  Widget build(BuildContext context) {
    final driverData = "${driver.driverId} ${driver.firstName}"
        " ${driver.lastName}";

    return Container(
      height: 85.vertical,
      width: 85.horizontal,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Top(driverData: driverData),
          Expanded(
            child: SetLocationWebView(
              driverId: driver.id.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
