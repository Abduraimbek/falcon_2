///
/// Created by Abduraimbek Yarkinov at 10:43 on 23.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Dashboard",
            style: MyTextStyles.interMediumFirst(fontSize: 3.8),
          ),
        ],
      ),
    );
  }
}
