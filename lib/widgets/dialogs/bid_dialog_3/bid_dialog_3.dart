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
  required OrderModel4 orderModel,
}) async {
  OrderRepository4.seen(orderModel);
  orderModel4OrderModel4 = orderModel;

  fromFrom = orderModel.pickUpAt ?? "";
  toTo = orderModel.deliverTo ?? "";
  orderIdOrderId = int.tryParse(orderModel.orderId ?? "") ?? 0;

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      content: _BidDialog(
        orderModel: orderModel,
      ),
      contentPadding: EdgeInsets.zero,
      backgroundColor: MyColors.cardColor,
    ),
  );
}

class _BidDialog extends ConsumerWidget {
  const _BidDialog({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  final OrderModel4 orderModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 100.vertical,
      height: 90.vertical,
      child: Builder(
        builder: (context) {
          if (orderModel.link == null) {
            return buildColumn(OrderByLinkModel3.nullModel());
          } else {
            return FutureBuilder<OrderByLinkModel3?>(
              future: OrderApi4().orderByLink(orderModel.link ?? ""),
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
                  orderModel: orderModel,
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
