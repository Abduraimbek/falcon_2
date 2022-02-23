///
/// Created by Abduraimbek Yarkinov at 18:25 on 08.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class QuotePrice extends ConsumerStatefulWidget {
  const QuotePrice({
    Key? key,
    required this.quotePrice,
  }) : super(key: key);
  final double quotePrice;

  @override
  ConsumerState createState() => _QuotePriceState();
}

class _QuotePriceState extends ConsumerState<QuotePrice> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: "${widget.quotePrice}");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Quote Price*:    ",
          style: style,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            readOnly: true,
            style: style,
            decoration: const InputDecoration(
              isDense: true,
            ),
            inputFormatters: [
              MyInputFormatters.currencyInputFormatter,
            ],
          ),
        ),
        Text(
          "  USD",
          style: style,
        )
      ],
    );
  }
}
