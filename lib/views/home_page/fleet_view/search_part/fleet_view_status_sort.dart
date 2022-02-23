///
/// Created by Abduraimbek Yarkinov at 16:04 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:falcon_2/providers/providers.dart';

class FleetViewStatusSort extends ConsumerStatefulWidget {
  const FleetViewStatusSort({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FleetViewSortState();
}

class _FleetViewSortState extends ConsumerState<FleetViewStatusSort> {
  int status = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.52.vertical,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: MyColors.tensTextColor, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              "assets/svg2/sort.svg",
              color: MyColors.tensTextColor,
              width: 1.66.vertical,
              height: 1.66.vertical,
              fit: BoxFit.cover,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: status,
              style: MyTextStyles.interMediumFirst(),
              focusColor: Colors.transparent,
              items: const [
                DropdownMenuItem(
                  value: -1,
                  child: Text("Any Duty Status"),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text("In Service"),
                ),
                DropdownMenuItem(
                  value: 0,
                  child: Text("Out of Service"),
                ),
              ],
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    status = value;
                  });
                  ref.read(driverListProvider.notifier).changeStatus(status);
                }
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
