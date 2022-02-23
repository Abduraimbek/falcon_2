///
/// Created by Abduraimbek Yarkinov at 11:01 on 09.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class Dimensions extends StatefulWidget {
  const Dimensions({
    Key? key,
    required this.width,
    required this.length,
    required this.height,
  }) : super(key: key);

  final String width;
  final String height;
  final String length;

  @override
  _DimensionsState createState() => _DimensionsState();
}

class _DimensionsState extends State<Dimensions> {
  late TextEditingController lC;
  late TextEditingController hC;
  late TextEditingController wC;

  @override
  void initState() {
    super.initState();
    lC = TextEditingController(text: widget.length);
    hC = TextEditingController(text: widget.height);
    wC = TextEditingController(text: widget.width);
  }

  @override
  void dispose() {
    lC.dispose();
    hC.dispose();
    wC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          controller: lC,
        ),
        Text(" x ", style: style),
        buildField(
          style: style,
          hintStyle: style2,
          hintText: "Width",
          controller: wC,
        ),
        Text(" x ", style: style),
        buildField(
          style: style,
          hintStyle: style2,
          hintText: "Height",
          controller: hC,
        ),
        Text(" in    ", style: style),
      ],
    );
  }

  Widget buildField({
    required TextStyle style,
    required TextStyle hintStyle,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Expanded(
      child: TextField(
        style: style,
        controller: controller,
        readOnly: true,
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
