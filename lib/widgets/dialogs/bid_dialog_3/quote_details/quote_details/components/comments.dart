///
/// Created by Abduraimbek Yarkinov at 10:35 on 09.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class Comments extends ConsumerWidget {
  const Comments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Comments:", style: style),
        TextField(
          onChanged: (value) {
            ref.read(quoteDetailsProvider).typeComments(value);
          },
          style: style,
          decoration: const InputDecoration(
            isDense: true,
          ),
        )
      ],
    );
  }
}
