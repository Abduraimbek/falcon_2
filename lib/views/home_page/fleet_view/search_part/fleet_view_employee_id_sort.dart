///
/// Created by Abduraimbek Yarkinov at 16:04 on 27.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';

class FleetViewEmployeeIdSort extends ConsumerStatefulWidget {
  const FleetViewEmployeeIdSort({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FleetViewSortState();
}

class _FleetViewSortState extends ConsumerState<FleetViewEmployeeIdSort> {
  List<_Employee> employees = [_Employee(id: -1, name: "All employees")];
  late _Employee selectedEmployee;

  @override
  void initState() {
    super.initState();
    final list = MyObjectbox.store
        .box<EmployeeModel>()
        .getAll()
        .map((e) => _Employee(id: e.id, name: e.fullName))
        .toList();
    employees.addAll(list);
    selectedEmployee = employees.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.52.vertical,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: MyColors.tensTextColor, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              "assets/svg2/sort.svg",
              color: MyColors.tensTextColor,
              width: 1.66.vertical,
              height: 1.66.vertical,
              fit: BoxFit.cover,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<_Employee>(
              value: selectedEmployee,
              style: MyTextStyles.interMediumFirst(),
              focusColor: Colors.transparent,
              items: employees
                  .map((e) => DropdownMenuItem<_Employee>(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedEmployee = value;
                  });
                  ref
                      .read(driverListProvider.notifier)
                      .changeEmployeeId(selectedEmployee.id);
                }
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class _Employee {
  final int id;
  final String name;

  _Employee({
    required this.id,
    required this.name,
  });
}
