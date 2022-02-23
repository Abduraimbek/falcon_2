///
/// Created by Abduraimbek Yarkinov at 18:07 on 01.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class MyTextFieldForCreateEmployee extends StatelessWidget {
  const MyTextFieldForCreateEmployee({
    Key? key,
    required this.label,
    required this.onChanged,
    this.autofocus = false,
    this.hintText = "",
    this.isDecimalInputFormatter = false,
  }) : super(key: key);

  final String label;
  final bool autofocus;
  final String hintText;
  final Function(String value) onChanged;
  final bool isDecimalInputFormatter;

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst();
    final hintStyle = MyTextStyles.interMediumSecond();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("$label:", style: style),
        const SizedBox(width: 35),
        Container(
          height: 2.5.vertical,
          width: 30.vertical,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: const Color(0xffbababa),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.only(left: 15),
          child: TextField(
            onChanged: onChanged,
            autofocus: autofocus,
            style: style,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle,
            ),
            inputFormatters: isDecimalInputFormatter
                ? [MyInputFormatters.decimalInputFormatter]
                : null,
          ),
        ),
      ],
    );
  }
}
