///
/// Created by Abduraimbek Yarkinov at 10:54 on 09.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class VehicleType extends ConsumerWidget {
  const VehicleType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);
    final vehicleType = ref.watch(quoteDetailsProvider).vehicleType;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Vehicle Type:    ", style: style),
        DropdownButton<String>(
          value: vehicleType,
          style: style,
          onChanged: (v) {
            ref
                .watch(quoteDetailsProvider)
                .typeVehicleType(v ?? MyStrings.vehicleTypes.first);
          },
          items: MyStrings.vehicleTypes
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e, style: style),
                ),
              )
              .toList(),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
