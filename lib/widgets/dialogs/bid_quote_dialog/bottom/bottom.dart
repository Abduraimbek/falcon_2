///
/// Created by Abduraimbek Yarkinov at 11:07 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class Bottom extends ConsumerWidget {
  const Bottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 7.81.vertical,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          SizedBox(width: 35),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
