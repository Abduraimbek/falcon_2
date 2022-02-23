///
/// Created by Abduraimbek Yarkinov at 16:37 on 05.01.2022.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:collection/collection.dart';
import 'package:falcon_2/utils/utils.dart';

class SelectEmployee extends ConsumerStatefulWidget {
  const SelectEmployee({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SelectEmployeeState();
}

class _SelectEmployeeState extends ConsumerState<SelectEmployee> {
  final employees = MyObjectbox.store.box<EmployeeModel>().getAll();
  _EmployeeModel selectedEmployee = _EmployeeModel.notSelected;
  List<_EmployeeModel> list = [];

  void _selectEmployee(int id) {
    selectedEmployee = list.firstWhereOrNull((element) => element.id == id) ??
        _EmployeeModel.notSelected;
  }

  @override
  void initState() {
    super.initState();
    list = employees
        .map((e) => _EmployeeModel(id: e.id, name: e.fullName))
        .toList();
    list.insert(0, _EmployeeModel.notSelected);
    _selectEmployee(ref.read(updateDriverDialogProvider.notifier).employeeId);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<_EmployeeModel>(
      focusColor: Colors.transparent,
      value: selectedEmployee,
      items: list
          .map((e) => DropdownMenuItem<_EmployeeModel>(
                value: e,
                child: Text(
                  e.name,
                  style: MyTextStyles.interMediumFirst(),
                ),
              ))
          .toList(),
      onChanged: (v) {
        if (v != null) {
          ref.read(updateDriverDialogProvider.notifier).selectEmployee(v.id);
          _selectEmployee(v.id);
          setState(() {});
        }
      },
    );
  }
}

class _EmployeeModel {
  final int id;
  final String name;

  _EmployeeModel({
    required this.id,
    required this.name,
  });

  static final notSelected = _EmployeeModel(
    id: 0,
    name: "Not selected",
  );
}
