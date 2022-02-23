///
/// Created by Abduraimbek Yarkinov at 13:13 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';
import 'dashboard/dashboard.dart';
import 'fleet_view/fleet_view.dart';
import 'create_load/create_load.dart';
import 'active_shipments/active_shipments.dart';
import 'employee/employee.dart';
import 'quoted_loads/quoted_loads.dart';
import 'posted_loads_3/posted_loads.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawer = ref.watch(drawerProvider);
    final label = _getDrawerLabel(drawer);

    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: MyBitsDojoWindow(
        child: MyDrawer(
          label: label,
          child: Material(
            color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Builder(
                builder: (_) {
                  switch (drawer) {
                    case DrawerEnum.dashboard:
                      return const Dashboard();
                    case DrawerEnum.postedLoads:
                      return const PostedLoads3();
                    case DrawerEnum.quotedLoads:
                      return const QuotedLoads();
                    case DrawerEnum.activeShipments:
                      return const ActiveShipments();
                    case DrawerEnum.createLoad:
                      return const CreateLoad();
                    case DrawerEnum.archiveShipments:
                      return Container();
                    case DrawerEnum.units:
                      return Container();
                    case DrawerEnum.fleetView:
                      return const FleetView();
                    case DrawerEnum.employees:
                      return const Employee();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getDrawerLabel(DrawerEnum drawer) {
    switch (drawer) {
      case DrawerEnum.dashboard:
        return "Dashboard";
      case DrawerEnum.postedLoads:
        return "Posted Loads";
      case DrawerEnum.quotedLoads:
        return "Quoted Loads";
      case DrawerEnum.activeShipments:
        return "Active Shipments";
      case DrawerEnum.createLoad:
        return "Created Load";
      case DrawerEnum.archiveShipments:
        return "Archive Shipments";
      case DrawerEnum.units:
        return "Units";
      case DrawerEnum.fleetView:
        return "Fleet View";
      case DrawerEnum.employees:
        return "Employees";
    }
  }
}
