///
/// Created by Abduraimbek Yarkinov at 18:27 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'build_image.dart';
import 'build_info.dart';
import 'build_edit_sms_buttons.dart';
import 'package:falcon_2/singletons/singletons.dart';

class DriverImageInfo extends StatelessWidget {
  const DriverImageInfo({
    Key? key,
    required this.driverModel,
  }) : super(key: key);

  final DriverModel driverModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        left: 15,
        right: 15,
        bottom: 10,
      ),
      child: Container(
        width: double.infinity,
        height: 13.vertical,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: MyColors.myShadow,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BuildImage(),
            const SizedBox(width: 16),
            BuildInfo(driverModel: driverModel),
            const Spacer(),
            BuildEditSMSButtons(
              status: driverModel.status == 1,
              id: driverModel.id,
              driverModel: driverModel,
            ),
          ],
        ),
      ),
    );
  }
}
