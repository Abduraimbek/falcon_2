///
/// Created by Abduraimbek Yarkinov at 12:27 on 14.12.2021.
///

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class MyBitsDojoWindow extends StatelessWidget {
  MyBitsDojoWindow({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final colors = WindowButtonColors(
    iconMouseDown: Colors.white,
    iconMouseOver: Colors.white,
    iconNormal: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WindowTitleBarBox(
          child: Container(
            color: Colors.black,
            child: Row(
              children: [
                Expanded(child: MoveWindow()),
                MinimizeWindowButton(colors: colors),
                MaximizeWindowButton(colors: colors),
              ],
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
