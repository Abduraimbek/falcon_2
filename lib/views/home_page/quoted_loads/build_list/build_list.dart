///
/// Created by Abduraimbek Yarkinov at 17:51 on 18.11.2021.
///

import 'dart:async';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'item.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class BuildList extends ConsumerStatefulWidget {
  const BuildList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BuildListState();
}

class _BuildListState extends ConsumerState<BuildList> {
  late ScrollController controller;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      QuotedOrdersSingleton.getQuotedOrders();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(quotedOrdersProvider).orders;

    return ListView.separated(
      itemCount: list.length,
      controller: controller,
      itemBuilder: (context, index) {
        return InkWell(
          onDoubleTap: () {
            ref.read(quotedOrdersProvider).notificationSeenOnOrder(list[index]);
            showBidQuoteDialog(
              context: context,
              quotedOrder: list[index],
            );
          },
          onTap: () {
            // GmailObserver.disableAllNotifications();
          },
          child: Item(orderModel: list[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          width: double.infinity,
          color: MyColors.secondTextColor,
        );
      },
    );
  }
}
