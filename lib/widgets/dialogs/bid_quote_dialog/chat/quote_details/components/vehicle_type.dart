///
/// Created by Abduraimbek Yarkinov at 10:54 on 09.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class VehicleType extends ConsumerWidget {
  const VehicleType({
    Key? key,
    required this.vehicleType,
  }) : super(key: key);

  final String vehicleType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Vehicle Type:    ", style: style),
        Text(
          vehicleType,
          style: style,
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
