///
/// Created by Abduraimbek Yarkinov at 17:19 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'build_current_status.dart';
import 'build_location_updated.dart';
import 'buttons.dart';

class CurrentStatus extends StatelessWidget {
  const CurrentStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuildCurrentStatus(),
          const SizedBox(width: 70),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              BuildLocationUpdated(
                text1: "Location updated",
                text2: "40 minutes ago 02.11.2021 (UTC+05:00)",
                child: SizedBox(),
              ),
              SizedBox(height: 4),
              BuildLocationUpdated(
                text1: "Current Location",
                text2: "40 minutes ago 02.11.2021 (UTC+05:00)",
                child: Buttons(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
