///
/// Created by Abduraimbek Yarkinov at 12:52 on 04.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildCheckBox extends ConsumerStatefulWidget {
  const BuildCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BuildCheckBoxState();
}

class _BuildCheckBoxState extends ConsumerState<BuildCheckBox> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Can driver get Load offers",
              style: MyTextStyles.interMediumFirst(),
            ),
            const SizedBox(width: 30),
            Checkbox(
              checkColor: Colors.white,
              activeColor: MyColors.backgroundColor,
              value: value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (v) {
                setState(() {
                  value = v ?? false;
                });

                ref
                    .read(createDriverDialogProvider.notifier)
                    .changeCanGetLoadOffers(value);
              },
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
