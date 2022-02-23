///
/// Created by Abduraimbek Yarkinov at 16:59 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:falcon_2/providers/providers.dart';

class UnderTop extends ConsumerWidget {
  const UnderTop({
    Key? key,
    required this.template,
  }) : super(key: key);

  final int template;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 3.03.vertical,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildItem(
            isFirst: true,
            selected: template == 1,
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: MyColors.secondTextColor,
          ),
          buildItem(
            isFirst: false,
            selected: template == 2,
          ),
        ],
      ),
    );
  }

  Widget buildItem({
    required bool isFirst,
    required bool selected,
  }) {
    return Expanded(
      child: Center(
        child: Material(
          color: selected ? Colors.red.withOpacity(.3) : Colors.transparent,
          child: SizedBox(
            height: 3.03.vertical,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg1/logo.svg",
                  width: 1.86.vertical,
                  height: 1.86.vertical,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Text(
                  isFirst ? "Falcon" : "Azam",
                  style: MyTextStyles.interMediumFirst(
                    color: isFirst ? MyColors.blueColor : MyColors.redColor,
                    fontSize: 3.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
