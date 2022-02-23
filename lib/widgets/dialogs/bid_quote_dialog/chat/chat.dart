///
/// Created by Abduraimbek Yarkinov at 11:24 on 22.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'top/under_top.dart';
import 'chat_part/chat_part.dart';
import 'quote_details/quote_details.dart';
import 'package:falcon_2/providers/providers.dart';

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
    required this.model,
    required this.quotedOrderModel,
  }) : super(key: key);

  final QuoteByIdModel model;
  final QuotedOrderModel quotedOrderModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffc4c4c4).withOpacity(.05),
      child: Column(
        children: [
          Container(
            height: 23,
            width: double.infinity,
            color: MyColors.cardColor,
          ),
          const Top(),
          Container(
            height: 2,
            width: double.infinity,
            color: MyColors.redColor,
          ),
          UnderTop(template: model.template ?? 1),
          Container(
            width: double.infinity,
            height: 1,
            color: MyColors.secondTextColor,
          ),
          Expanded(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final b = ref.watch(chatOrInfoProvider).isInfo;
                if (b) {
                  return QuoteDetails(quoteByIdModel: model);
                } else {
                  return ChatPart(
                    subject: quotedOrderModel.subject ?? "",
                    gmail: quotedOrderModel.mail ?? "",
                    isFalcon: (model.template ?? 1) == 1,
                    quoteId: model.id ?? 0,
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
