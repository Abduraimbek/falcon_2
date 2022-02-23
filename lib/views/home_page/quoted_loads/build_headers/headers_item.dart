///
/// Created by Abduraimbek Yarkinov at 11:22 on 19.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class HeadersItem extends StatelessWidget {
  const HeadersItem({
    Key? key,
    required this.flex,
    required this.label,
    this.numberFormat = false,
    this.hasPadding = false,
  }) : super(key: key);

  final int flex;
  final String label;
  final bool numberFormat;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.only(right: hasPadding ? 10 : 0),
        child: Text(
          label,
          textAlign: numberFormat == false ? TextAlign.start : TextAlign.end,
          style: MyTextStyles.interMediumSecond(),
        ),
      ),
    );
  }
}
