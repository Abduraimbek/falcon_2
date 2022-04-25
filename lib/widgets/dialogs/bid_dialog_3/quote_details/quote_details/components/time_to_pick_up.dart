///
/// Created by Abduraimbek Yarkinov at 20:16 on 08.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class TimeToPickUp extends ConsumerWidget {
  const TimeToPickUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "ETA to Pick-up:  ",
          style: style,
        ),
        Expanded(
          child: TextField(
            onChanged: (value) {
              ref.read(quoteDetailsProvider).typeTimeToPickUp(value);
            },
            autofocus: true,
            style: style,
            decoration: const InputDecoration(
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
