///
/// Created by Abduraimbek Yarkinov at 17:20 on 14.12.2021.
///

import 'package:flutter/material.dart';
import 'top/top.dart';
import 'fields/build_fields.dart';

Future<List<String>?> showCheckEmailDialog({
  required BuildContext context,
  required bool isFalcon,
}) async {
  List<String>? result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _CheckEmailDialog(isFalcon: isFalcon),
    ),
  );

  return result;
}

class _CheckEmailDialog extends StatelessWidget {
  const _CheckEmailDialog({
    Key? key,
    required this.isFalcon,
  }) : super(key: key);

  final bool isFalcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Top(isFalcon: isFalcon),
          const BuildFields(),
        ],
      ),
    );
  }
}
