///
/// Created by Abduraimbek Yarkinov at 16:45 on 27.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_item.dart';

class FleetViewList extends ConsumerStatefulWidget {
  const FleetViewList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FleetViewListState();
}

class _FleetViewListState extends ConsumerState<FleetViewList> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    DriverSingleton.getDrivers();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final drivers = ref.watch(driverListProvider);
    final style = MyTextStyles.interMediumTens();

    return ListView.separated(
      controller: controller,
      itemCount: drivers.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (MyPrefsFields.isOpenOnBrowser) {
              launch(
                "http://89.223.71.112:8084/?id=${drivers[index].driverId}",
                forceWebView: true,
              );
            } else {
              showSetDriverLocationDialog(
                context: context,
                driver: drivers[index],
              );
            }
          },
          child: BuildItem(
            driver: drivers[index],
            style: style,
            onChanged: (bool value) async {
              showWaitingDialog(context);
              final newDriverModel =
                  drivers[index].copyWith(status: value ? 1 : 0);
              await DriverApi.updateDriver(driverModel: newDriverModel);
              await DriverSingleton.getDrivers();
              Navigator.pop(context);
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 1,
          color: MyColors.secondTextColor,
        );
      },
    );
  }
}
