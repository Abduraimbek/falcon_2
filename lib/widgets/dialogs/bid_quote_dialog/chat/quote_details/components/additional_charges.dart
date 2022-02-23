///
/// Created by Abduraimbek Yarkinov at 19:37 on 08.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class AdditionalCharges extends ConsumerStatefulWidget {
  const AdditionalCharges({
    Key? key,
    required this.pricePerMile,
    required this.additionalCharges,
  }) : super(key: key);

  final double additionalCharges;
  final double pricePerMile;

  @override
  ConsumerState createState() => _AdditionalChargesState();
}

class _AdditionalChargesState extends ConsumerState<AdditionalCharges> {
  late TextEditingController addC;
  late TextEditingController perC;

  @override
  void initState() {
    super.initState();
    addC = TextEditingController(text: widget.additionalCharges.toString());
    perC = TextEditingController(text: widget.pricePerMile.toString());
  }

  @override
  void dispose() {
    addC.dispose();
    perC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        buildItem(
          controller: addC,
          label: "Additional charges",
          isDecimal: false,
        ),
        const SizedBox(height: 5),
        buildItem(
          controller: perC,
          label: "usd per mile",
          isDecimal: true,
        ),
      ],
    );
  }

  Widget buildItem({
    required String label,
    required bool isDecimal,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            readOnly: true,
            controller: controller,
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
