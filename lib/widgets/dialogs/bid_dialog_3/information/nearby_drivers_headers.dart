///
/// Created by Abduraimbek Yarkinov at 15:32 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class NearbyDriversHeaders extends StatelessWidget {
  const NearbyDriversHeaders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interRegularSecond(fontSize: 3.4);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 35,
          child: Center(
            child: Text("№", style: style),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text("Nearby Driver", style: style),
        ),
        Expanded(
          flex: 1,
          child: Text("Distance", style: style),
        ),
        Expanded(
          flex: 3,
          child: Text("Notes", style: style),
        ),
      ],
    );
  }
}
