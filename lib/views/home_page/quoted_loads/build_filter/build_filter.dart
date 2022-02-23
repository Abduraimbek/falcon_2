///
/// Created by Abduraimbek Yarkinov at 19:07 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'ref_filter.dart';
import 'origin_filter.dart';
import 'destination_filter.dart';

class BuildFilter extends ConsumerWidget {
  const BuildFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(width: 30),
          RefFilter(),
          SizedBox(width: 50),
          OriginFilter(),
          SizedBox(width: 50),
          DestinationFilter(),
        ],
      ),
    );
  }
}
