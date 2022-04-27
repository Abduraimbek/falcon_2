import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class BuildList extends ConsumerStatefulWidget {
  const BuildList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BuildListState();
}

class _BuildListState extends ConsumerState<BuildList> {
  late ScrollController controller;
  late TextStyle blackSimpleStyle;
  late TextStyle timeStyle;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    UpdateOrders4().startTimer();

    blackSimpleStyle = MyTextStyles.interMediumFirst();
    timeStyle = MyTextStyles.interMediumFirst(
      fontSize: 3,
      isBold: true,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    UpdateOrders4().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(orderListProvider4);
    final viewingOrderId = ref.watch(viewingOrderIdProvider);

    return ListView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];

        return InkWell(
          onTap: () {
            if (viewingOrderId == null) {
              ref.read(viewingOrderIdProvider.notifier).state = item.orderId;
              OrderRepository4.seen(item);
            } else {
              ref.read(viewingOrderIdProvider.notifier).state = null;
              ref.read(orderListProvider4.notifier).setState();
            }
          },
          onDoubleTap: () {
            showBidDialog3(
              context: context,
              orderModel: item,
            );
          },
          child: Item(
            orderModel: item,
            blackSimpleStyle: blackSimpleStyle,
            timeStyle: timeStyle,
            isViewing: item.orderId == viewingOrderId,
          ),
        );
      },
    );
  }
}
