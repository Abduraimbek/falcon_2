///
/// Created by Abduraimbek Yarkinov at 16:46 on 13.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class OriginFilter extends ConsumerStatefulWidget {
  const OriginFilter({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _RefFilterState();
}

class _RefFilterState extends ConsumerState<OriginFilter> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
        text: ref.read(orderListProvider3.notifier).origin);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst();
    final style2 = MyTextStyles.interMediumSecond();

    return SizedBox(
      width: 12.horizontal,
      child: TextField(
        onChanged: (value) {
          // ref.read(ordersUrlProvider).typeOrigin(value);
          ref.read(orderListProvider3.notifier).typeOrigin(value);
        },
        controller: controller,
        style: style,
        decoration: InputDecoration(
          hintStyle: style2,
          isDense: true,
          hintText: "Origin",
        ),
      ),
    );
  }
}
