///
/// Created by Abduraimbek Yarkinov at 18:12 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'current_leg.dart';
import 'pick_up_and_delivery.dart';

class LocationAndCargo extends StatelessWidget {
  const LocationAndCargo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 35,
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "LOCATION & CARGO",
            style: MyTextStyles.interMediumFirst(
              color: const Color(0xff8c91a5),
            ),
          ),
          const SizedBox(height: 20),
          const CurrentLeg(),
          const SizedBox(height: 45),
          const PickUpAndDelivery(),
        ],
      ),
    );
  }
}
