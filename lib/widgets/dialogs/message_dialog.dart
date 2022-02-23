///
/// Created by Abduraimbek Yarkinov at 16:55 on 20.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/widgets.dart';

Future<void> showMessageDialog({
  required BuildContext context,
  required String message,
}) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(
        message,
        style: MyTextStyles.interMediumFirst(),
      ),
      actions: [
        MyButton(
          text: "OK",
          onTap: () {
            Navigator.of(context).pop();
          },
          color: MyColors.backgroundColor,
        ),
      ],
    ),
  );
}
