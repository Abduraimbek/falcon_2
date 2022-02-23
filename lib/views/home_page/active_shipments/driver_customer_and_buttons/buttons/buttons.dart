///
/// Created by Abduraimbek Yarkinov at 15:48 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'build_button.dart';
import 'send_location_in.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SendLocationIn(),
          BuildButton(
            svgPath: "assets/svg2/pencil.svg",
            label: "Edit",
          ),
          BuildButton(
            svgPath: "assets/svg3/note.svg",
            label: "Copy",
          ),
          BuildButton(
            svgPath: "assets/svg3/task_notes.svg",
            label: "Notes",
          ),
          BuildButton(
            svgPath: "assets/svg3/hashtag.svg",
            label: "Logs",
          ),
        ],
      ),
    );
  }
}
