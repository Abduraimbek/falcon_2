///
/// Created by Abduraimbek Yarkinov at 15:11 on 29.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/singletons/singletons.dart';

class BuildInfo extends StatelessWidget {
  const BuildInfo({
    Key? key,
    required this.driverModel,
  }) : super(key: key);

  final DriverModel driverModel;

  @override
  Widget build(BuildContext context) {
    final styleBold = MyTextStyles.interMediumFirst(
      fontSize: 4.2,
    );
    final styleLightGrey = MyTextStyles.interMediumFirst(
      color: const Color(0xff979797),
      fontSize: 3.5,
    );
    final styleDarkGrey = MyTextStyles.interMediumFirst(
      color: const Color(0xff636465),
      fontSize: 3.5,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: styleLightGrey,
            children: [
              TextSpan(
                text: "${driverModel.firstName} ${driverModel.lastName}",
                style: styleBold,
              ),
              TextSpan(
                text: "               ID №: ",
                style: styleLightGrey,
              ),
              TextSpan(
                text: driverModel.driverId,
                style: styleDarkGrey,
              ),
            ],
          ),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            style: styleLightGrey,
            children: [
              TextSpan(text: "Carrier:", style: styleLightGrey),
              TextSpan(text: " Falcon Group LLC", style: styleDarkGrey),
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: styleLightGrey,
            children: [
              TextSpan(text: "Email: ", style: styleLightGrey),
              TextSpan(text: driverModel.mail, style: styleDarkGrey),
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: styleLightGrey,
            children: [
              TextSpan(text: "Contact No: ", style: styleLightGrey),
              TextSpan(text: driverModel.phone, style: styleDarkGrey),
            ],
          ),
        ),
      ],
    );
  }
}
