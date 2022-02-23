///
/// Created by Abduraimbek Yarkinov at 17:11 on 03.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'build_fields/build_fields.dart';
import 'build_buttons/build_buttons.dart';

Future<void> showAddDriverDialog({
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _AddDriverDialog(),
    ),
  );
}

class _AddDriverDialog extends StatelessWidget {
  const _AddDriverDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 99.8.vertical,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Top(),
          BuildFields(),
          SizedBox(height: 30),
          BuildButtons(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
