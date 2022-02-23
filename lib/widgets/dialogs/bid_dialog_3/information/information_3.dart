///
/// Created by Abduraimbek Yarkinov at 18:25 on 24.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter/services.dart';
import 'bottom.dart';

class Information3 extends StatelessWidget {
  const Information3({
    Key? key,
    required this.orderByLinkModel3,
    required this.orderModel3,
  }) : super(key: key);

  final OrderModel3 orderModel3;
  final OrderByLinkModel3 orderByLinkModel3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        topText(),
        const SizedBox(height: 10),
        buildText(
          "Pick-up at: ",
          MyStringHelper.minusWhenNull(orderModel3.pickUpAt),
        ),
        buildText(
          "Pick-up date (EST): ",
          MyStringHelper.minusWhenNull(orderModel3.pickUpDate),
        ),
        const SizedBox(height: 10),
        buildText(
          "Deliver to: ",
          MyStringHelper.minusWhenNull(orderModel3.deliverTo),
        ),
        buildText(
          "Delivery date (EST): ",
          MyStringHelper.minusWhenNull(orderModel3.deliverDate),
        ),
        const SizedBox(height: 10),
        buildText(
          "Miles: ",
          MyStringHelper.minusWhenNull(orderModel3.miles),
        ),
        buildText(
          "Pieces: ",
          MyStringHelper.minusWhenNull(orderModel3.pieces),
        ),
        buildText(
          "Weight: ",
          MyStringHelper.minusWhenNull(orderModel3.weight),
        ),
        buildText(
          "Dims: ",
          MyStringHelper.minusWhenNull(orderByLinkModel3.dims),
        ),
        buildText(
          "CSA Load ? : ",
          MyStringHelper.minusWhenNull(orderByLinkModel3.csaLoad),
        ),
        buildText(
          "Load type ? : ",
          MyStringHelper.minusWhenNull(orderByLinkModel3.loadType),
        ),
        buildText(
          "Hazardous ? : ",
          MyStringHelper.minusWhenNull(orderByLinkModel3.hazMaterial),
        ),
        buildText(
          "Dock Level ? : ",
          MyStringHelper.minusWhenNull(orderByLinkModel3.dockLevel),
        ),
        const SizedBox(height: 10),
        buildText(
          "Notes: ",
          MyStringHelper.minusWhenNull(orderByLinkModel3.notes),
        ),
        const SizedBox(height: 10),
        Container(
          height: 1,
          width: double.infinity,
          color: MyColors.secondTextColor,
        ),
        const SizedBox(height: 10),
        buildText2(MyStringHelper.minusWhenNull(orderByLinkModel3.companyName)),
        const SizedBox(height: 10),
        buildText2("Company address: " +
            MyStringHelper.minusWhenNull(orderByLinkModel3.companyAddress)),
        buildText2("Load posted by: " +
            MyStringHelper.minusWhenNull(orderByLinkModel3.postedBy)),
        buildText2(
            "Phone: ${MyStringHelper.minusWhenNull(orderByLinkModel3.postedByPhone)}"),
        Expanded(
          child: Bottom(
            orderByLinkModel3: orderByLinkModel3,
            orderModel3: orderModel3,
          ),
        ),
      ],
    );
  }

  Widget topText() {
    String text = "SHIPMENT DETAILS                ";

    text += MyStringHelper.getMinutesAgo(orderModel3.postDate);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MyTextStyles.interMediumSecond(fontSize: 3.7),
        ),
        copyClipboardButton(),
      ],
    );
  }

  Widget buildText2(String text) {
    final style = MyTextStyles.interMediumSecond(fontSize: 3.6)
        .copyWith(fontWeight: FontWeight.w600);
    return Text(text, style: style);
  }

  Widget buildText(String text1, String text2) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.7).copyWith(
      fontWeight: FontWeight.w700,
    );

    return Text("$text1$text2", style: style);
  }

  Widget copyClipboardButton() {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.7).copyWith(
      fontWeight: FontWeight.w700,
    );

    return TextButton(
      onPressed: () {
        String copy = "";
        copy += "Pick-up at: ${orderModel3.pickUpAt}\n";
        copy += "Pick-up date (EST): ${orderModel3.pickUpDate}\n\n";
        copy += "Deliver to: ${orderModel3.deliverTo}\n";
        copy += "Delivery date (EST): ${orderModel3.deliverDate}\n\n";
        copy += "Miles: ${orderModel3.miles}\n";
        copy += "Pieces: ${orderModel3.pieces}\n";
        copy += "Weight: ${orderModel3.weight}\n\n";
        copy += "Notes: ${orderByLinkModel3.notes}";
        Clipboard.setData(ClipboardData(text: copy));
      },
      child: Text(
        "Copy",
        style: style,
      ),
    );
  }
}
