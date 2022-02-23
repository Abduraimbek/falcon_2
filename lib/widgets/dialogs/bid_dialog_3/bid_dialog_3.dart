///
/// Created by Abduraimbek Yarkinov at 10:29 on 22.11.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'package:falcon_2/providers/providers.dart';
import 'information/information_3.dart';
import 'bottom/bottom.dart';
import 'quote_details/quote_details.dart';

Future<void> showBidDialog3({
  required BuildContext context,
  required OrderModel3 orderModel3,
}) async {
  OrderFalconSingleton.seen(orderModel3);
  orderModel3OrderModel3 = orderModel3;

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      content: _BidDialog(
        orderModel3: orderModel3,
      ),
      contentPadding: EdgeInsets.zero,
      backgroundColor: MyColors.cardColor,
    ),
  );
}

class _BidDialog extends ConsumerWidget {
  const _BidDialog({
    Key? key,
    required this.orderModel3,
  }) : super(key: key);

  final OrderModel3 orderModel3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 100.vertical,
      height: 90.vertical,
      child: Builder(
        builder: (context) {
          if (orderModel3.orderLink == null) {
            return buildColumn(OrderByLinkModel3.nullModel());
          } else {
            return FutureBuilder<OrderByLinkModel3?>(
              future: OrderApi3.orderByLink(orderModel3),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return buildColumn(OrderByLinkModel3.nullModel());
                }

                if (snapshot.hasData == false) {
                  return buildColumn(OrderByLinkModel3.nullModel());
                } else {
                  if (snapshot.data == null) {
                    return buildColumn(OrderByLinkModel3.nullModel());
                  } else {
                    final model = snapshot.data!;
                    orderByLinkModel3OrderByLinkModel3 = model;
                    fromFrom = orderModel3.pickUpAt ?? "";
                    toTo = orderModel3.deliverTo ?? "";
                    orderIdOrderId =
                        int.tryParse(orderModel3.orderId ?? "") ?? 0;

                    return buildColumn(model);
                  }
                }
              },
            );
          }
        },
      ),
    );
  }

  Column buildColumn(OrderByLinkModel3 model) {
    return Column(
      children: [
        Top(
          ref: MyStringHelper.minusWhenNull(model.refNo),
        ),
        Expanded(
          child: Row(
            children: [
              const SizedBox(width: 30),
              Expanded(
                flex: 5,
                child: Information3(
                  orderModel3: orderModel3,
                  orderByLinkModel3: model,
                ),
              ),
              const SizedBox(width: 65),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: QuoteDetailsPart(
                        orderByLinkModel3: model,
                      ),
                    ),
                    const Bottom(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

// Widget errorView() {
//   return Padding(
//     padding: EdgeInsets.all(20.vertical),
//     child: const ErrorBoyWidget(boxFit: BoxFit.cover),
//   );
// }
//
// Widget loadingView() {
//   return Padding(
//     padding: EdgeInsets.all(20.vertical),
//     child: const LoadingPaperplaneWidget(boxFit: BoxFit.cover),
//   );
// }
}
