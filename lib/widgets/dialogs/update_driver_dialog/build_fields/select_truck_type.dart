///
/// Created by Abduraimbek Yarkinov at 20:56 on 18.12.2021.
///

import 'package:falcon_2/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';

class SelectTruckType extends ConsumerStatefulWidget {
  const SelectTruckType({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SelectTruckTypeState();
}

class _SelectTruckTypeState extends ConsumerState<SelectTruckType> {
  String value = MyStrings.vehicleTypes.first;

  @override
  void initState() {
    super.initState();
    value = MyStrings
        .vehicleTypes[ref.read(updateDriverDialogProvider.notifier).truckType];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusColor: Colors.transparent,
      value: value,
      items: MyStrings.vehicleTypes
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: MyTextStyles.interMediumFirst(),
                ),
              ))
          .toList(),
      onChanged: (v) {
        if (v != null) {
          setState(() {
            value = v;
            ref
                .read(updateDriverDialogProvider.notifier)
                .selectTruckType(MyStrings.vehicleTypes.indexOf(value));
          });
        }
      },
    );
  }
}
