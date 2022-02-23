///
/// Created by Abduraimbek Yarkinov at 17:48 on 03.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';

class Left extends ConsumerWidget {
  const Left({
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
            onChanged: (value) => provider.typeFirstName(value),
            label: "First name",
            autofocus: true,
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            onChanged: (value) => provider.typeMail(value),
            label: "Email",
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            onChanged: (value) => provider.typePhone(value),
            label: "Phone",
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            onChanged: (value) => provider.typeLength(value),
            label: "Length (inch)",
            isDecimalInputFormatter: true,
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            onChanged: (value) => provider.typeWidth(value),
            label: "Width (inch)",
            isDecimalInputFormatter: true,
          ),
          const SizedBox(height: 13),
          MyTextFieldForCreateEmployee(
            onChanged: (value) => provider.typeHeight(value),
            label: "Height (inch)",
            isDecimalInputFormatter: true,
          ),
        ],
      ),
    );
  }
}
