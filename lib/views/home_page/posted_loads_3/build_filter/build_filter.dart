///
/// Created by Abduraimbek Yarkinov at 19:07 on 18.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'ref_filter.dart';
import 'origin_filter.dart';
import 'destination_filter.dart';
import 'vehicle_type_filter.dart';

class BuildFilter extends ConsumerWidget {
  const BuildFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 30),
          const RefFilter(),
          const SizedBox(width: 50),
          const VehicleTypeFilter(),
          const SizedBox(width: 50),
          const OriginFilter(),
          const SizedBox(width: 50),
          const DestinationFilter(),
          const SizedBox(width: 50),
          buildAllSeen(),
        ],
      ),
    );
  }

  Widget buildAllSeen() {
    return MyButtonView(
      onTap: () {
        OrderFalconSingleton.allSeen();
      },
      child: Text(
        "All seen",
        style: MyTextStyles.interMediumFirst(color: MyColors.redColor).copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
