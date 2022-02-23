///
/// Created by Abduraimbek Yarkinov at 12:01 on 13.12.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';
import 'build_item.dart';

class EmployeeList extends ConsumerStatefulWidget {
  const EmployeeList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EmployeeListState();
}

class _EmployeeListState extends ConsumerState<EmployeeList> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    EmployeeSingleton.getEmployees();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employees = ref.watch(employeeListProvider);
    final style = MyTextStyles.interMediumTens();

    return ListView.separated(
      controller: controller,
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];

        return BuildItem(style: style, employee: employee);
      },
      separatorBuilder: (_, __) {
        return Container(
          width: double.infinity,
          height: 1,
          color: MyColors.secondTextColor,
        );
      },
    );
  }
}
