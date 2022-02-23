///
/// Created by Abduraimbek Yarkinov at 12:04 on 04.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';
import 'select_truck_type.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'select_employee.dart';

class Right extends ConsumerWidget {
  const Right({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(updateDriverDialogProvider.notifier);

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 35),
          MyTextFieldForUpdateEmployee(
            label: "Last name",
            onChanged: (value) => provider.typeLastName(value),
            text: driverModelDriverModel.lastName ?? "",
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            label: "Driver ID",
            onChanged: (value) => provider.typeDriverId(value),
            text: driverModelDriverModel.driverId ?? "",
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            label: "License number",
            onChanged: (value) => provider.typeLicenseNumber(value),
            text: driverModelDriverModel.licenseNumber ?? "",
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            onChanged: (value) => provider.typeWeight(value),
            label: "Weight (lbs)",
            isDecimalInputFormatter: true,
            text: driverModelDriverModel.weight.toString(),
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            onChanged: (value) => provider.typeCompany(value),
            label: "Company",
            text: driverModelDriverModel.company ?? "",
          ),
          const SizedBox(height: 13),
          const SelectTruckType(),
          const SelectEmployee(),
        ],
      ),
    );
  }
}
