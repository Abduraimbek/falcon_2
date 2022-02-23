///
/// Created by Abduraimbek Yarkinov at 17:41 on 20.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> showWaitingDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpinKitThreeBounce(
            color: MyColors.backgroundColor,
            size: 15,
            duration: Duration(seconds: 2),
          ),
          const SizedBox(height: 10),
          Text(
            "Loading",
            style: MyTextStyles.interMediumFirst(
              color: MyColors.backgroundColor,
            ),
          ),
        ],
      ),
    ),
  );
}
