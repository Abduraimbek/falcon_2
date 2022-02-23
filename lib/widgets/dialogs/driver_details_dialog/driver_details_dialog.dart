///
/// Created by Abduraimbek Yarkinov at 17:42 on 27.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'driver_image_info/driver_image_info.dart';
import 'driver_line_charts/driver_line_charts.dart';
import 'driver_build_list/driver_build_list.dart';
import 'package:falcon_2/providers/providers.dart';

Future<void> showDriverDetailsDialog({
  required BuildContext context,
  required int id,
  required DriverModel driverModel,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _DriverDetailsDialog(
        id: id,
        driverModel: driverModel,
      ),
    ),
  );
}

class _DriverDetailsDialog extends ConsumerWidget {
  const _DriverDetailsDialog({
    Key? key,
    required this.id,
    required this.driverModel,
  }) : super(key: key);

  final int id;
  final DriverModel driverModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 70.61.vertical,
      width: 99.8.vertical,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          const Top(),
          Expanded(
            child: Column(
              children: [
                DriverImageInfo(driverModel: driverModel),
                const DriverLineCharts(),
                const SizedBox(height: 31),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: MyColors.thirdTextColor,
                ),
                const DriverBuildList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
