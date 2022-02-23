///
/// Created by Abduraimbek Yarkinov at 13:22 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'components/logo.dart';
import 'components/menu_item.dart';
import 'components/header_item.dart';
import 'package:falcon_2/providers/providers.dart';

class Menus extends ConsumerWidget {
  const Menus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawer = ref.watch(drawerProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Logo(),
          const SizedBox(height: 50),
          MenuItem(
            isSelected: drawer == DrawerEnum.dashboard,
            svgPath: "assets/svg_drawer/drawer_overview.svg",
            label: "Dashboard",
            onTap: () {
              ref
                  .read(drawerProvider.notifier)
                  .pressDrawerItem(DrawerEnum.dashboard);
            },
          ),
          const HeaderItem(header: "LOADBOARD"),
          MenuItem(
            isSelected: drawer == DrawerEnum.postedLoads,
            svgPath: "assets/svg_drawer/drawer_posted_loads.svg",
            label: "Posted Loads",
            onTap: () {
              ref
                  .read(drawerProvider.notifier)
                  .pressDrawerItem(DrawerEnum.postedLoads);
            },
          ),
          MenuItem(
            isSelected: drawer == DrawerEnum.quotedLoads,
            svgPath: "assets/svg_drawer/drawer_quoted_loads.svg",
            label: "Quoted Loads",
            onTap: () {
              ref
                  .read(drawerProvider.notifier)
                  .pressDrawerItem(DrawerEnum.quotedLoads);
            },
          ),
          const HeaderItem(header: "SHIPMENT"),
          MenuItem(
            isSelected: drawer == DrawerEnum.activeShipments,
            svgPath: "assets/svg_drawer/drawer_active_shipment.svg",
            label: "Active Shipments",
            onTap: () {
              ref
                  .read(drawerProvider.notifier)
                  .pressDrawerItem(DrawerEnum.activeShipments);
            },
          ),
          MenuItem(
            isSelected: drawer == DrawerEnum.createLoad,
            svgPath: "assets/svg_drawer/drawer_create_load.svg",
            label: "Create Load",
            onTap: () {
              ref
                  .read(drawerProvider.notifier)
                  .pressDrawerItem(DrawerEnum.createLoad);
            },
          ),
          MenuItem(
            isSelected: false,
            svgPath: "assets/svg_drawer/drawer_archive_shipment.svg",
            label: "Archive Shipments",
            onTap: () {
              // OrderSingleton3.getOrdersBackgroundMethod();
            },
          ),
          const HeaderItem(header: "MANAGE FLEET"),
          MenuItem(
            isSelected: false,
            svgPath: "assets/svg_drawer/drawer_units.svg",
            label: "Units",
            onTap: () {},
          ),
          MenuItem(
            isSelected: drawer == DrawerEnum.fleetView,
            svgPath: "assets/svg_drawer/drawer_fleet_view.svg",
            label: "Fleet view",
            onTap: () {
              ref
                  .read(drawerProvider.notifier)
                  .pressDrawerItem(DrawerEnum.fleetView);
            },
          ),
          const HeaderItem(header: "KPI"),
          const HeaderItem(header: "SETTINGS"),
          buildItemEmployee(drawer, ref),
        ],
      ),
    );
  }

  Widget buildItemEmployee(DrawerEnum drawer, WidgetRef ref) {
    if (MyPrefsFields.isRoot) {
      return MenuItem(
        isSelected: drawer == DrawerEnum.employees,
        svgPath: "assets/svg3/create_employee.svg",
        label: "Employees",
        onTap: () {
          ref
              .read(drawerProvider.notifier)
              .pressDrawerItem(DrawerEnum.employees);
        },
      );
    } else {
      if (MyPrefsFields.isAccessEmployee) {
        return MenuItem(
          isSelected: drawer == DrawerEnum.employees,
          svgPath: "assets/svg3/create_employee.svg",
          label: "Employees",
          onTap: () {
            ref
                .read(drawerProvider.notifier)
                .pressDrawerItem(DrawerEnum.employees);
          },
        );
      } else {
        return const SizedBox();
      }
    }
  }
}
