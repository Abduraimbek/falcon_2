///
/// Created by Abduraimbek Yarkinov at 11:24 on 22.11.2021.
///

import 'package:falcon_2/singletons/api/api.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'top/under_top.dart';
import 'quote_details/quote_details.dart';

class QuoteDetailsPart extends StatelessWidget {
  const QuoteDetailsPart({
    Key? key,
    required this.orderByLinkModel3,
  }) : super(key: key);

  final OrderByLinkModel3 orderByLinkModel3;

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
          const UnderTop(),
          Container(
            width: double.infinity,
            height: 1,
            color: MyColors.secondTextColor,
          ),
          Expanded(
            child: QuoteDetails(
              orderByLinkModel3: orderByLinkModel3,
            ),
          ),
        ],
      ),
    );
  }
}
