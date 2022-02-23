///
/// Created by Abduraimbek Yarkinov at 17:12 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'build_messages.dart';
import 'build_text_field.dart';
import 'package:falcon_2/utils/utils.dart';

class ChatPart extends StatelessWidget {
  const ChatPart({
    Key? key,
    required this.gmail,
    required this.isFalcon,
    required this.quoteId,
    required this.subject,
  }) : super(key: key);

  final String gmail;
  final bool isFalcon;
  final int quoteId;
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BuildMessages(
            gmail: gmail,
            isFalcon: isFalcon,
            subject: subject,
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: MyColors.secondTextColor,
        ),
        BuildTextField(
          quoteId: quoteId,
        ),
      ],
    );
  }
}
