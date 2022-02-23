///
/// Created by Abduraimbek Yarkinov at 10:29 on 22.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'bottom/bottom.dart';
import 'information/information.dart';
import 'chat/chat.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:collection/collection.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/singletons/singletons.dart';

Future<void> showBidQuoteDialog({
  required BuildContext context,
  required QuotedOrderModel quotedOrder,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      content: _BidQuoteDialog(
        quotedOrderModel: quotedOrder,
      ),
      contentPadding: EdgeInsets.zero,
      backgroundColor: MyColors.cardColor,
    ),
  );
}

class _BidQuoteDialog extends ConsumerStatefulWidget {
  const _BidQuoteDialog({
    Key? key,
    required this.quotedOrderModel,
  }) : super(key: key);

  final QuotedOrderModel quotedOrderModel;

  @override
  ConsumerState createState() => __BidQuoteDialogState();
}

class __BidQuoteDialogState extends ConsumerState<_BidQuoteDialog> {
  QuoteByIdModel? quoteByIdModel;

  Future _getQuoteById() async {
    quoteByIdModel =
        await QuotedOrdersApi.quoteById(id: widget.quotedOrderModel.id);
    if (quoteByIdModel != null) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _getQuoteById();
  }

  @override
  Widget build(BuildContext context) {
    if (quoteByIdModel == null) {
      return SizedBox(
        width: 92.vertical,
        height: 62.5.vertical,
        child: const Center(
          child: LoadingPaperplaneWidget(boxFit: BoxFit.cover),
        ),
      );
    } else {
      fromFrom = quoteByIdModel!.order?.origin ?? "";
      toTo = quoteByIdModel!.order?.destination ?? "";

      final nearbyDriver = driversDriversDrivers.firstOrNull;
      if (nearbyDriver != null) {
        if (nearbyDriver.lat != null && nearbyDriver.long != null) {
          stopStop = "${nearbyDriver.lat}, ${nearbyDriver.long}";
        } else {
          stopStop = "";
        }
      } else {
        stopStop = "";
      }

      return SizedBox(
        width: 92.vertical,
        height: 62.5.vertical,
        child: Column(
          children: [
            Top(
              refId: MyStringHelper.minusWhenNull(
                  quoteByIdModel!.order?.requestRef),
            ),
            Expanded(
              child: Row(
                children: [
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 5,
                    child: Information(
                      model: quoteByIdModel!.order!,
                    ),
                  ),
                  const SizedBox(width: 65),
                  Expanded(
                    flex: 3,
                    child: Chat(
                      model: quoteByIdModel!,
                      quotedOrderModel: widget.quotedOrderModel,
                    ),
                  ),
                ],
              ),
            ),
            const Bottom(),
          ],
        ),
      );
    }
  }
}
