///
/// Created by Abduraimbek Yarkinov at 15:31 on 29.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:falcon_2/widgets/dialogs/update_driver_dialog/add_driver_dialog.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildEditSMSButtons extends StatelessWidget {
  const BuildEditSMSButtons({
    Key? key,
    required this.status,
    required this.id,
    required this.driverModel,
  }) : super(key: key);

  final bool status;
  final int id;
  final DriverModel driverModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        buildAvailable(status),
        const Spacer(),
        buildButtons(context),
      ],
    );
  }

  Widget buildButtons(BuildContext context) {
    bool addDriverAccess = MyPrefsFields.isRoot || MyPrefsFields.isAccessDriver;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildButtonView(
          onTap: () async {
            showSetDriverLocationDialog(context: context, driver: driverModel);
          },
          child: const Icon(
            Icons.location_on,
            size: 20,
            color: MyColors.redColor,
          ),
        ),
        addDriverAccess
            ? buildButtonView(
                onTap: () async {
                  final result = await showYesNoDialog(
                    context: context,
                    message:
                        "Are you sure to delete driver ${driverModel.firstName}",
                  );

                  if (result) {
                    showWaitingDialog(context);
                    final result = await DriverApi.delete(id);
                    Navigator.pop(context);
                    if (result) {
                      DriverSingleton.getDrivers();
                      Navigator.pop(context);
                    }
                  }
                },
                child: SvgPicture.asset(
                  "assets/svg4/delete.svg",
                  color: MyColors.redColor,
                  width: 2.0.vertical,
                  height: 2.0.vertical,
                  fit: BoxFit.cover,
                ),
              )
            : const SizedBox(),
        addDriverAccess
            ? buildButtonView(
                onTap: () {
                  showUpdateDriverDialog(
                    context: context,
                    driverModel: driverModel,
                  );
                },
                child: SvgPicture.asset(
                  "assets/svg2/pencil.svg",
                  color: MyColors.redColor,
                  width: 2.0.vertical,
                  height: 2.0.vertical,
                  fit: BoxFit.cover,
                ),
              )
            : const SizedBox(),
        buildButtonView(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg1/messages.svg",
                color: MyColors.redColor,
                width: 2.0.vertical,
                height: 2.0.vertical,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Text(
                "Message",
                style: MyTextStyles.interMediumFirst(
                  fontSize: 3.45,
                  color: MyColors.redColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButtonView({
    required VoidCallback onTap,
    required Widget child,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          hoverColor: MyColors.redColor.withOpacity(.1),
          focusColor: MyColors.redColor.withOpacity(.1),
          splashColor: MyColors.redColor.withOpacity(.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget buildAvailable(bool status) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          "assets/svg2/circle.svg",
          width: 9,
          height: 9,
          color: status ? MyColors.greenColor : MyColors.redColor,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Text(
          status ? "Available" : "Not available",
          style: MyTextStyles.interMediumFirst(
            color: status ? MyColors.greenColor : MyColors.redColor,
            fontSize: 3.6,
          ),
        ),
      ],
    );
  }
}
