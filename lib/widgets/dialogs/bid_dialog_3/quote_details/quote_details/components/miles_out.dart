///
/// Created by Abduraimbek Yarkinov at 18:25 on 08.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class MilesOut extends ConsumerWidget {
  const MilesOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Miles Out:    ",
          style: style,
        ),
        Expanded(
          child: TextField(
            onChanged: (value) {
              ref.read(quoteDetailsProvider).typeMilesOut(value);
            },
            autofocus: true,
            style: style,
            decoration: const InputDecoration(
              isDense: true,
            ),
            inputFormatters: [
              MyInputFormatters.decimalInputFormatter,
            ],
          ),
        ),
        Text(
          "  miles",
          style: style,
        )
      ],
    );
  }
}
