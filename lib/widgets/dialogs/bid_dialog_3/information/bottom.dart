///
/// Created by Abduraimbek Yarkinov at 13:07 on 22.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'nearby_drivers_list.dart';
import 'nearby_drivers_headers.dart';
import 'build_map_webview.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
    required this.orderByLinkModel3,
    required this.orderModel,
  }) : super(key: key);

  final OrderByLinkModel3 orderByLinkModel3;
  final OrderModel4 orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.secondTextColor, width: 1),
            ),
            child: Column(
              children: [
                const BuildMapWebview(),
                const SizedBox(height: 4),
                const NearbyDriversHeaders(),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: MyColors.secondTextColor,
                ),
                Expanded(
                  child: NearbyDriversList(
                    origin: orderModel.pickUpAt ?? "",
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
