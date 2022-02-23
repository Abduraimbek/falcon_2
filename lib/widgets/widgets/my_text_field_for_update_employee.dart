///
/// Created by Abduraimbek Yarkinov at 18:07 on 01.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class MyTextFieldForUpdateEmployee extends StatefulWidget {
  const MyTextFieldForUpdateEmployee({
    Key? key,
    required this.label,
    required this.onChanged,
    this.autofocus = false,
    this.hintText = "",
    required this.text,
    this.isDecimalInputFormatter = false,
  }) : super(key: key);

  final String label;
  final bool autofocus;
  final String hintText;
  final Function(String value) onChanged;
  final String text;
  final bool isDecimalInputFormatter;

  @override
  State<MyTextFieldForUpdateEmployee> createState() =>
      _MyTextFieldForUpdateEmployeeState();
}

class _MyTextFieldForUpdateEmployeeState
    extends State<MyTextFieldForUpdateEmployee> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst();
    final hintStyle = MyTextStyles.interMediumSecond();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("${widget.label}:", style: style),
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
            controller: controller,
            onChanged: widget.onChanged,
            autofocus: widget.autofocus,
            style: style,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: hintStyle,
            ),
            inputFormatters: widget.isDecimalInputFormatter
                ? [MyInputFormatters.decimalInputFormatter]
                : null,
          ),
        ),
      ],
    );
  }
}
