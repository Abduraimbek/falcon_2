///
/// Created by Abduraimbek Yarkinov at 17:48 on 03.12.2021.
///

import 'package:falcon_2/singletons/api/api.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';

class Left extends ConsumerWidget {
  const Left({
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
            onChanged: (value) => provider.typeFirstName(value),
            label: "First name",
            autofocus: true,
            text: driverModelDriverModel.firstName ?? "",
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            onChanged: (value) => provider.typeMail(value),
            label: "Email",
            text: driverModelDriverModel.mail ?? "",
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            onChanged: (value) => provider.typePhone(value),
            label: "Phone",
            text: driverModelDriverModel.phone ?? "",
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            onChanged: (value) => provider.typeLength(value),
            label: "Length (inch)",
            isDecimalInputFormatter: true,
            text: driverModelDriverModel.length.toString(),
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            onChanged: (value) => provider.typeWidth(value),
            label: "Width (inch)",
            isDecimalInputFormatter: true,
            text: driverModelDriverModel.width.toString(),
          ),
          const SizedBox(height: 13),
          MyTextFieldForUpdateEmployee(
            onChanged: (value) => provider.typeHeight(value),
            label: "Height (inch)",
            isDecimalInputFormatter: true,
            text: driverModelDriverModel.height.toString(),
          ),
        ],
      ),
    );
  }
}
