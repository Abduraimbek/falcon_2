///
/// Created by Abduraimbek Yarkinov at 16:10 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem({
    Key? key,
    required this.header,
  }) : super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 15, bottom: 8),
      child: Text(
        header,
        style: MyTextStyles.interMediumFirst(
          color: MyColors.drawerHeaderColor,
        ),
      ),
    );
  }
}
