///
/// Created by Abduraimbek Yarkinov at 18:44 on 07.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

Future<bool> showYesNoDialog({
  required BuildContext context,
  required String message,
}) async {
  final result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Center(
        child: Text(
          "Attention !!!",
          style: MyTextStyles.interMediumFirst(
            color: MyColors.redColor,
            fontSize: 5,
          ),
        ),
      ),
      content: Text(
        message,
        style: MyTextStyles.interMediumFirst(
          color: MyColors.backgroundColor,
        ),
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyColors.redColor),
          ),
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            "No",
            style: MyTextStyles.interMediumFirst(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(MyColors.backgroundColor),
          ),
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            "Yes",
            style: MyTextStyles.interMediumFirst(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  return result;
}
