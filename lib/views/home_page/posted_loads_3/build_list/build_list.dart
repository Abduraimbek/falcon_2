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

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    UpdateOrders4().startTimer();
    // UpdateRepository().startTimer();
  }

  @override
  void dispose() {
    controller.dispose();
    UpdateOrders4().dispose();
    // UpdateRepository().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(orderListProvider4);

    return ListView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];

        return InkWell(
          onDoubleTap: () {
            showBidDialog3(
              context: context,
              orderModel: item,
            );
          },
          child: Item(orderModel: item),
        );
      },
    );
  }
}
