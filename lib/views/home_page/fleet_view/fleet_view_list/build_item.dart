///
/// Created by Abduraimbek Yarkinov at 17:01 on 04.12.2021.
///

import 'package:falcon_2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.style,
    required this.driver,
    required this.onChanged,
  }) : super(key: key);

  final TextStyle style;
  final DriverModel driver;
  final Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text("${driver.driverId}", style: style),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "${driver.firstName} ${driver.lastName}",
              style: style,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              MyStrings.vehicleTypes[driver.truckType],
              style: style,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              driver.status == 1 ? "In Service" : "Out of Service",
              style: style.copyWith(
                color: driver.status == 1
                    ? MyColors.greenColor
                    : MyColors.redColor,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(
              MyStringHelper.minusWhenNull(driver.location),
              style: style,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              MyStringHelper.minusWhenNull(driver.employeeName),
              style: style,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              MyStringHelper.minusWhenNull(driver.notes),
              style: style,
            ),
          ),
          MyButtonView(
            onTap: () {
              showDriverNotesDialog(context: context, driverModel: driver);
            },
            child: SvgPicture.asset(
              "assets/svg2/pencil.svg",
              fit: BoxFit.cover,
              color: MyColors.backgroundColor,
            ),
          ),
          MyButtonView(
            onTap: () {
              showDriverDetailsDialog(
                context: context,
                id: driver.id,
                driverModel: driver,
              );
            },
            child: const Icon(
              Icons.info_outline,
              color: MyColors.backgroundColor,
            ),
          ),
          buildSwitch(),
        ],
      ),
    );
  }

  Widget buildSwitch() {
    return Switch(
      onChanged: onChanged,
      value: driver.status == 1,
    );
  }
}
