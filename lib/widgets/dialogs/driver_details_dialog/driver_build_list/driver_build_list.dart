///
/// Created by Abduraimbek Yarkinov at 10:28 on 29.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'build_item.dart';

class DriverBuildList extends StatefulWidget {
  const DriverBuildList({Key? key}) : super(key: key);

  @override
  State<DriverBuildList> createState() => _DriverBuildListState();
}

class _DriverBuildListState extends State<DriverBuildList> {
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style1 = MyTextStyles.interMediumFirst(
      color: MyColors.redColor,
      fontSize: 3.4,
    );
    final style2 = MyTextStyles.interMediumFirst(fontSize: 3.4);
    final style3 = MyTextStyles.interMediumSecond(fontSize: 3.0);

    return Expanded(
      child: ListView.separated(
        controller: controller,
        itemCount: 10,
        itemBuilder: (context, index) {
          return BuildItem(
            style1: style1,
            style2: style2,
            style3: style3,
          );
        },
        separatorBuilder: (_, __) => Container(
          width: double.infinity,
          height: 1,
          color: MyColors.thirdTextColor,
        ),
      ),
    );
  }
}
