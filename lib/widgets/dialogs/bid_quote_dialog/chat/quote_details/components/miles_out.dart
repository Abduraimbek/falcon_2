///
/// Created by Abduraimbek Yarkinov at 18:25 on 08.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class MilesOut extends ConsumerStatefulWidget {
  const MilesOut({
    Key? key,
    required this.milesOut,
  }) : super(key: key);

  final double milesOut;

  @override
  ConsumerState createState() => _MilesOutState();
}

class _MilesOutState extends ConsumerState<MilesOut> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.milesOut.toString());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            readOnly: true,
            style: style,
            controller: controller,
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
