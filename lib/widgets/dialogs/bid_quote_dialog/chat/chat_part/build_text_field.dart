///
/// Created by Abduraimbek Yarkinov at 17:59 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:falcon_2/providers/providers.dart';

class BuildTextField extends ConsumerStatefulWidget {
  const BuildTextField({
    Key? key,
    required this.quoteId,
  }) : super(key: key);

  final int quoteId;

  @override
  ConsumerState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends ConsumerState<BuildTextField> {
  late TextEditingController controller;
  late FocusNode focusNode;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (_sending == false) {
      _sending = true;

      if (controller.text != "") {
        ref.read(chattingProvider).sendMessage(
              quoteId: widget.quoteId,
              message: controller.text,
            );
        controller.clear();
      }

      focusNode.requestFocus();
      _sending = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.8.vertical,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onSubmitted: (v) {
                _sendMessage();
              },
              autofocus: true,
              controller: controller,
              focusNode: focusNode,
              style: MyTextStyles.interMediumFirst(
                fontSize: 3.6,
              ),
              decoration: InputDecoration(
                hintText: "Write a message...",
                isDense: true,
                border: InputBorder.none,
                hintStyle: MyTextStyles.interMediumFirst(
                  color: const Color(0xffbababa),
                  fontSize: 3.6,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              ref.read(chattingProvider).pickFile(widget.quoteId);
            },
            icon: SvgPicture.asset(
              "assets/svg1/sms_stick.svg",
              fit: BoxFit.cover,
              color: MyColors.backgroundColor,
            ),
          ),
          IconButton(
            onPressed: () async {
              _sendMessage();
            },
            icon: SvgPicture.asset(
              "assets/svg1/sms_send.svg",
              fit: BoxFit.cover,
              color: MyColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
