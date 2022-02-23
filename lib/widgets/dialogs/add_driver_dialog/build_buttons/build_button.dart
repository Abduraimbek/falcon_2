///
/// Created by Abduraimbek Yarkinov at 12:52 on 04.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildButton extends ConsumerWidget {
  const BuildButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(createDriverDialogProvider);

    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: MyButton(
            color: provider
                ? MyColors.redColor
                : MyColors.redColor.withOpacity(.4),
            text: "Create",
            onTap: () {
              if (provider) {
                ref
                    .read(createDriverDialogProvider.notifier)
                    .pressCreateDriverButton(context: context);
              }
            },
          ),
        ),
      ),
    );
  }
}
