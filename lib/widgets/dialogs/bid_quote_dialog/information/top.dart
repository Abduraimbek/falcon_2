///
/// Created by Abduraimbek Yarkinov at 11:59 on 22.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class Top extends StatelessWidget {
  const Top({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuoteByIdOrderModel model;

  @override
  Widget build(BuildContext context) {
    final style2 = MyTextStyles.interMediumSecond(fontSize: 3.4);
    final style = MyTextStyles.interMediumFirst(fontSize: 3.5);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopItem(style: style2, text: "SHIPMENT DETAILS"),
              buildItem(
                text1: "Customer",
                text2: MyStringHelper.minusWhenNull(model.postedBy),
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 2,
              ),
              buildItem(
                text1: "Target Price",
                text2: "N/A",
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 2,
              ),
              buildItem(
                text1: "Loaded Miles",
                text2: MyStringHelper.minusWhenNull(model.totalMiles) + " mi",
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 2,
              ),
              buildItem(
                text1: "Stackable",
                text2: MyStringHelper.minusWhenNull(model.stackable),
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 2,
              ),
              buildItem(
                text1: "Dock Level",
                text2: MyStringHelper.minusWhenNull(model.dockLevel),
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 2,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopItem(style: style2, text: "Expires In: 00:01:11"),
              buildItem(
                text1: "Hazardous",
                text2: MyStringHelper.minusWhenNull(model.hazardous),
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 1,
              ),
              buildItem(
                text1: "Fast Load",
                text2: MyStringHelper.minusWhenNull(model.fastLoad),
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 1,
              ),
              buildItem(
                text1: "Sug. truck size",
                text2: MyStringHelper.minusWhenNull(model.suggestedTruckSize),
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 1,
              ),
              buildItem(
                text1: "Pieces",
                text2: MyStringHelper.minusWhenNull(model.pieces),
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 1,
              ),
              buildItem(
                text1: "Weight",
                text2: MyStringHelper.minusWhenNull(model.weight),
                style1: style,
                style2: style2,
                flex1: 1,
                flex2: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTopItem({
    required TextStyle style,
    required text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 3),
      child: Text(text, style: style),
    );
  }

  Widget buildItem({
    required String text1,
    required String text2,
    required TextStyle style1,
    required TextStyle style2,
    required int flex1,
    required int flex2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            flex: flex1,
            child: Text(text1, style: style1),
          ),
          Expanded(
            flex: flex2,
            child: Text(text2, style: style2),
          ),
        ],
      ),
    );
  }
}
