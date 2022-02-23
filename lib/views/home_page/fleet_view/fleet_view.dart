///
/// Created by Abduraimbek Yarkinov at 11:16 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'top/top.dart';
import 'search_part/search_part.dart';
import 'package:falcon_2/utils/utils.dart';
import 'fleet_view_list/fleet_view_list.dart';
import 'fleet_view_list/fleet_view_list_headers.dart';

class FleetView extends StatelessWidget {
  const FleetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Top(),
        Container(
          width: double.infinity,
          height: 1,
          color: MyColors.thirdTextColor,
        ),
        const SizedBox(height: 15),
        const SearchPart(),
        const FleetViewListHeaders(),
        const Expanded(child: FleetViewList()),
      ],
    );
  }
}
