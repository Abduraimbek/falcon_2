///
/// Created by Abduraimbek Yarkinov at 11:54 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:falcon_2/providers/providers.dart';

class FleetViewDriverSearchField extends ConsumerStatefulWidget {
  const FleetViewDriverSearchField({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FleetViewDriverSearchFieldState();
}

class _FleetViewDriverSearchFieldState
    extends ConsumerState<FleetViewDriverSearchField> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.52.vertical,
      width: 25.2.vertical,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: MyColors.tensTextColor, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              "assets/svg2/lupa.svg",
              color: MyColors.tensTextColor,
              width: 1.66.vertical,
              height: 1.66.vertical,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (v) {
                ref
                    .read(driverListProvider.notifier)
                    .searchByIdDriverNameLocation(v);
              },
              controller: controller,
              focusNode: focusNode,
              style: MyTextStyles.interRegularTens(),
              decoration: InputDecoration(
                hintText: "Driver id, name, location...",
                hintStyle: MyTextStyles.interRegularSecond(),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
