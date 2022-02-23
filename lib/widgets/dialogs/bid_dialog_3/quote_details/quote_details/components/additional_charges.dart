///
/// Created by Abduraimbek Yarkinov at 19:37 on 08.12.2021.
///

import 'package:falcon_2/widgets/dialogs/bid_dialog_3/quote_details/quote_details/components/quote_price.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class AdditionalCharges extends ConsumerWidget {
  const AdditionalCharges({
    Key? key,
    required this.totalMiles,
  }) : super(key: key);

  final double totalMiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        buildItem(
          label: "Additional charges",
          onChanged: (value) {
            ref.read(quoteDetailsProvider).typeAdditionalCharges(value);

            final usdPerMile = ref.read(quoteDetailsProvider).pricePerMile;
            final additionalCharges =
                ref.read(quoteDetailsProvider).additionalCharges;

            final quotePrice = totalMiles * usdPerMile + additionalCharges;

            bidDialogQuotePriceController?.clear();
            bidDialogQuotePriceController?.text = "$quotePrice";
            ref
                .read(quoteDetailsProvider)
                .typeQuotePrice(quotePrice.toString());
          },
          isDecimal: false,
        ),
        const SizedBox(height: 5),
        buildItem(
          label: "usd per mile",
          onChanged: (value) {
            ref.read(quoteDetailsProvider).typePricePerMile(value);

            final usdPerMile = ref.read(quoteDetailsProvider).pricePerMile;
            final additionalCharges =
                ref.read(quoteDetailsProvider).additionalCharges;

            final quotePrice = totalMiles * usdPerMile + additionalCharges;

            bidDialogQuotePriceController?.clear();
            bidDialogQuotePriceController?.text = "$quotePrice";
            ref
                .read(quoteDetailsProvider)
                .typeQuotePrice(quotePrice.toString());
          },
          isDecimal: true,
        ),
      ],
    );
  }

  Widget buildItem({
    required String label,
    required Function(String value) onChanged,
    required bool isDecimal,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChanged,
            style: MyTextStyles.interMediumFirst(fontSize: 3.3),
            decoration: InputDecoration(
              hintText: "0",
              hintStyle: MyTextStyles.interMediumSecond(),
              isDense: true,
            ),
            inputFormatters: [
              isDecimal
                  ? MyInputFormatters.decimalInputFormatter
                  : MyInputFormatters.currencyInputFormatter,
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            " $label",
            style: MyTextStyles.interMediumSecond(fontSize: 3.3),
          ),
        )
      ],
    );
  }
}
