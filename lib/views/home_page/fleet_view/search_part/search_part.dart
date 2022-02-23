///
/// Created by Abduraimbek Yarkinov at 11:48 on 27.11.2021.
///

import 'package:falcon_2/singletons/api/api.dart';
import 'package:flutter/material.dart';
import 'fleet_view_driver_search_field.dart';
import 'fleet_view_status_sort.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'fleet_view_employee_id_sort.dart';
import 'fleet_view_truck_type_sort.dart';

class SearchPart extends ConsumerWidget {
  const SearchPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool addDriverAccess = MyPrefsFields.isRoot || MyPrefsFields.isAccessDriver;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 25),
        const FleetViewDriverSearchField(),
        const SizedBox(width: 20),
        const FleetViewStatusSort(),
        const SizedBox(width: 20),
        const FleetViewEmployeeIdSort(),
        const SizedBox(width: 20),
        const FleetViewTruckTypeSort(),
        const Spacer(),
        MyButtonWithSvg(
          text: "Sync drivers",
          onTap: () {
            DriverSingleton.getDrivers();
          },
          color: MyColors.redColor,
          svgPath: "assets/svg4/sync.svg",
        ),
        const SizedBox(width: 20),
        addDriverAccess
            ? MyButtonWithSvg(
                text: "Add driver",
                onTap: () {
                  showAddDriverDialog(context: context);
                },
                color: MyColors.redColor,
                svgPath: "assets/svg2/plus.svg",
              )
            : const SizedBox(),
        const SizedBox(width: 40),
      ],
    );
  }
}
