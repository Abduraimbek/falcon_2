///
/// Created by Abduraimbek Yarkinov at 17:55 on 18.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/svg.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  final QuotedOrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    final redStyle = MyTextStyles.interMediumFirst(color: MyColors.redColor);
    final blackStyle = MyTextStyles.interMediumFirst();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Text(
              MyStringHelper.minusWhenNull(orderModel.requestRef),
              style: redStyle,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              MyStringHelper.minusWhenNull(orderModel.postedBy),
              style: blackStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              MyStringHelper.minusWhenNull(orderModel.vehicleType),
              maxLines: 1,
              style: blackStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              MyStringHelper.minusWhenNull(orderModel.origin),
              style: blackStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              MyStringHelper.minusWhenNull(orderModel.destination),
              style: blackStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              MyStringHelper.minusWhenNull(orderModel.totalMiles),
              textAlign: TextAlign.end,
              style: blackStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              MyStringHelper.minusWhenNull(orderModel.weight),
              textAlign: TextAlign.end,
              style: blackStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              MyStringHelper.moneyFormat(orderModel.price) + r"$",
              textAlign: TextAlign.end,
              style: blackStyle,
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  MyStringHelper.minusWhenNull(orderModel.createdDate),
                  style: blackStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset(
                    "assets/svg1/messages.svg",
                    color: orderModel.notificationCount > 0
                        ? MyColors.redColor
                        : MyColors.secondTextColor,
                    fit: BoxFit.cover,
                    width: 1.95.vertical,
                    height: 1.95.vertical,
                  ),
                ),
                Text(
                  orderModel.notificationCount > 0
                      ? "${orderModel.notificationCount}  "
                      : "",
                  style: redStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
