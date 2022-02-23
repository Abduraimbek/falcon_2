///
/// Created by Abduraimbek Yarkinov at 10:35 on 09.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class Comments extends StatefulWidget {
  const Comments({
    Key? key,
    required this.comments,
  }) : super(key: key);

  final String comments;

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.comments);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Comments:", style: style),
        TextField(
          controller: controller,
          readOnly: true,
          style: style,
          decoration: const InputDecoration(
            isDense: true,
          ),
        )
      ],
    );
  }
}
