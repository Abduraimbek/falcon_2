///
/// Created by Abduraimbek Yarkinov at 12:04 on 04.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';
import 'select_truck_type.dart';
import 'select_employee.dart';

class Right extends ConsumerWidget {
  const Right({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createDriverDialogProvider.notifier);

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 35),
          MyTextFieldForCreateEmployee(
            label: "Last name",
            onChanged: (value) => provider.typeLastName(value),
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            label: "Driver ID",
            onChanged: (value) => provider.typeDriverId(value),
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            label: "License number",
            onChanged: (value) => provider.typeLicenseNumber(value),
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            onChanged: (value) => provider.typeWeight(value),
            label: "Weight (lbs)",
            isDecimalInputFormatter: true,
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            onChanged: (value) => provider.typeCompany(value),
            label: "Company",
          ),
          const SizedBox(height: 13),
          const SelectTruckType(),
          const SelectEmployee(),
        ],
      ),
    );
  }
}
