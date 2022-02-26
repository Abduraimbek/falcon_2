///
/// Created by Abduraimbek Yarkinov at 17:56 on 13.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class VehicleTypeFilter extends ConsumerStatefulWidget {
  const VehicleTypeFilter({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _VehicleTypeFilterState();
}

class _VehicleTypeFilterState extends ConsumerState<VehicleTypeFilter> {
  late String value;
  late List<String> values;

  @override
  void initState() {
    super.initState();
    value = ref.read(orderListProvider4.notifier).vehicle;
    values = ["All", ...MyStrings.vehicleTypes];
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst();

    return DropdownButton<String>(
      value: value,
      focusColor: Colors.transparent,
      onChanged: (v) {
        if (v != null) {
          setState(() {
            value = v;
          });
          ref.read(orderListProvider4.notifier).selectVehicle(value);
        }
      },
      items: values
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e, style: style),
            ),
          )
          .toList(),
    );
  }
}
