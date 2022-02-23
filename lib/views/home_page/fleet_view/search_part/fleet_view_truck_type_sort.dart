///
/// Created by Abduraimbek Yarkinov at 16:04 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:falcon_2/providers/providers.dart';

class FleetViewTruckTypeSort extends ConsumerStatefulWidget {
  const FleetViewTruckTypeSort({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FleetViewSortState();
}

class _FleetViewSortState extends ConsumerState<FleetViewTruckTypeSort> {
  List<_TruckType> truckTypes = [_TruckType(id: -1, name: "All truck types")];
  late _TruckType selectedTruckType;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < MyStrings.vehicleTypes.length; i++) {
      truckTypes.add(_TruckType(id: i, name: MyStrings.vehicleTypes[i]));
    }
    selectedTruckType = truckTypes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.52.vertical,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: MyColors.tensTextColor, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              "assets/svg2/sort.svg",
              color: MyColors.tensTextColor,
              width: 1.66.vertical,
              height: 1.66.vertical,
              fit: BoxFit.cover,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<_TruckType>(
              value: selectedTruckType,
              style: MyTextStyles.interMediumFirst(),
              focusColor: Colors.transparent,
              items: truckTypes
                  .map((e) => DropdownMenuItem<_TruckType>(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedTruckType = value;
                  });
                  ref
                      .read(driverListProvider.notifier)
                      .changeTruckType(selectedTruckType.id);
                }
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class _TruckType {
  final int id;
  final String name;

  _TruckType({
    required this.id,
    required this.name,
  });
}
