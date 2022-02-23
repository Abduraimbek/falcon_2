///
/// Created by Abduraimbek Yarkinov at 17:45 on 11.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';

class BuildMapWebview extends ConsumerWidget {
  const BuildMapWebview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String from = fromFrom;
    String to = toTo;
    String stop = ref.watch(fromToStopProvider).stop;

    return SizedBox(
      height: 30.vertical,
      width: double.infinity,
      child: MyWebview(
        from: from,
        to: to,
        stop: stop,
      ),
    );
  }
}
