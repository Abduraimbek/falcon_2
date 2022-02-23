///
/// Created by Abduraimbek Yarkinov at 17:51 on 18.11.2021.
///

import 'dart:async';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';
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
  late Timer timer;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      OrderFalconSingleton.getOrders();
      OrderAzamSingleton.getOrders();
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
    final list = ref.watch(orderListProvider3);

    return ListView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];

        return InkWell(
          onDoubleTap: () {
            showBidDialog3(
              context: context,
              orderModel3: item,
            );
          },
          child: Item(orderModel: item),
        );
      },
    );
  }
}
