///
/// Created by Abduraimbek Yarkinov at 16:10 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class Top extends ConsumerWidget {
  const Top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInfo = ref.watch(chatOrInfoProvider).isInfo;

    return SizedBox(
      width: double.infinity,
      height: 4.69.vertical,
      child: Row(
        children: [
          buildButton(
            text: "QUOTE DETAILS",
            isSelected: isInfo,
            onTap: () {
              ref.read(chatOrInfoProvider).changeChatOrInfo(true);
            },
          ),
          buildButton(
            text: "CHAT",
            isSelected: !isInfo,
            onTap: () {
              ref.read(chatOrInfoProvider).changeChatOrInfo(false);
            },
          ),
        ],
      ),
    );
  }

  Widget buildButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text(
              text,
              style: MyTextStyles.interMediumFirst(
                fontSize: 3.8,
                color:
                    isSelected ? MyColors.redColor : MyColors.secondTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
