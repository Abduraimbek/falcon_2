///
/// Created by Abduraimbek Yarkinov at 19:03 on 11.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'my_webview_on_dialog.dart';
import 'top/top.dart';

Future<void> showMapViewDialog({
  required BuildContext context,
  required String from,
  required String to,
  required String? stop,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      content: _MapViewDialog(
        stop: stop,
        to: to,
        from: from,
      ),
      contentPadding: EdgeInsets.zero,
      backgroundColor: MyColors.cardColor,
    ),
  );
}

class _MapViewDialog extends StatefulWidget {
  const _MapViewDialog({
    Key? key,
    required this.from,
    required this.to,
    required this.stop,
  }) : super(key: key);

  final String from;
  final String to;
  final String? stop;

  @override
  _MapViewDialogState createState() => _MapViewDialogState();
}

class _MapViewDialogState extends State<_MapViewDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92.vertical,
      height: 62.5.vertical,
      child: Column(
        children: [
          const Top(),
          Expanded(
            child: Builder(
              builder: (_) {
                if (widget.stop == null) {
                  return MyWebview(
                    stop: null,
                    from: widget.from,
                    to: widget.to,
                  );
                } else {
                  return MyWebview(
                    from: widget.from,
                    to: widget.to,
                    stop: widget.stop,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
