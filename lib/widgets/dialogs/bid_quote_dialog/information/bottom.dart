///
/// Created by Abduraimbek Yarkinov at 13:07 on 22.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'bottom_top.dart';
import 'nearby_drivers_list.dart';
import 'nearby_drivers_headers.dart';
import 'build_map_webview.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuoteByIdOrderModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomTop(model: model),
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
                const Expanded(
                  child: NearbyDriversList(),
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
