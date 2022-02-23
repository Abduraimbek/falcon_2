///
/// Created by Abduraimbek Yarkinov at 17:11 on 03.12.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'build_fields/build_fields.dart';
import 'build_buttons/build_buttons.dart';
import 'package:falcon_2/providers/providers.dart';

Future<void> showUpdateDriverDialog({
  required BuildContext context,
  required DriverModel driverModel,
}) async {
  driverModel.toGlobalModel(driverModel);
  await showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _UpdateDriverDialog(),
    ),
  );
}

class _UpdateDriverDialog extends ConsumerStatefulWidget {
  const _UpdateDriverDialog({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => __UpdateDriverDialogState();
}

class __UpdateDriverDialogState extends ConsumerState<_UpdateDriverDialog> {
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
