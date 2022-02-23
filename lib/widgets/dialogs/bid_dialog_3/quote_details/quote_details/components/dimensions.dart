///
/// Created by Abduraimbek Yarkinov at 11:01 on 09.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class Dimensions extends ConsumerWidget {
  const Dimensions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);
    final style2 = MyTextStyles.interMediumSecond(fontSize: 3.3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Dimensions:   ", style: style),
        buildField(
          style: style,
          hintStyle: style2,
          hintText: "Length",
          onChanged: (value) {
            ref.read(quoteDetailsProvider).typeLength(value);
          },
        ),
        Text(" x ", style: style),
        buildField(
          style: style,
          hintStyle: style2,
          hintText: "Width",
          onChanged: (value) {
            ref.read(quoteDetailsProvider).typeWidth(value);
          },
        ),
        Text(" x ", style: style),
        buildField(
          style: style,
          hintStyle: style2,
          hintText: "Height",
          onChanged: (value) {
            ref.read(quoteDetailsProvider).typeHeight(value);
          },
        ),
        Text(" in    ", style: style),
      ],
    );
  }

  Widget buildField({
    required TextStyle style,
    required TextStyle hintStyle,
    required String hintText,
    required Function(String value) onChanged,
  }) {
    return Expanded(
      child: TextField(
        style: style,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          isDense: true,
        ),
        inputFormatters: [
          MyInputFormatters.decimalInputFormatter,
        ],
      ),
    );
  }
}
