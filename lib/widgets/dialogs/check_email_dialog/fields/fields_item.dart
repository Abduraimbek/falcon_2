///
/// Created by Abduraimbek Yarkinov at 17:35 on 14.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class FieldsItem extends StatelessWidget {
  const FieldsItem({
    Key? key,
    required this.onChanged,
    required this.autofocus,
    required this.hintText,
  }) : super(key: key);

  final Function(String) onChanged;
  final bool autofocus;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        style: MyTextStyles.interMediumFirst(),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: MyTextStyles.interMediumSecond(),
        ),
      ),
    );
  }
}
