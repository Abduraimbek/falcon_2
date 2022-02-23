///
/// Created by Abduraimbek Yarkinov at 18:25 on 08.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

TextEditingController? bidDialogQuotePriceController;

class QuotePrice extends ConsumerStatefulWidget {
  const QuotePrice({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _QuotePriceState();
}

class _QuotePriceState extends ConsumerState<QuotePrice> {
  @override
  void initState() {
    super.initState();
    bidDialogQuotePriceController = TextEditingController();
  }

  @override
  void dispose() {
    bidDialogQuotePriceController?.dispose();
    bidDialogQuotePriceController = null;
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
            onChanged: (value) {
              ref.read(quoteDetailsProvider).typeQuotePrice(value);
            },
            autofocus: true,
            style: style,
            controller: bidDialogQuotePriceController,
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
