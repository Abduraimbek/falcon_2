///
/// Created by Abduraimbek Yarkinov at 11:27 on 13.12.2021.
///

import 'dart:async';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final employeeListProvider = StateNotifierProvider.autoDispose<
    _EmployeeListNotifier, List<EmployeeModel>>((ref) {
  return _EmployeeListNotifier();
});

class _EmployeeListNotifier extends StateNotifier<List<EmployeeModel>> {
  _EmployeeListNotifier()
      : super(MyObjectbox.store.box<EmployeeModel>().getAll()) {
    final stream = MyObjectbox.store.box<EmployeeModel>().query().watch();

    subscription = stream.listen((event) {
      _employeeList = event.find();
      state = _employeeList;
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  late StreamSubscription subscription;
  List<EmployeeModel> _employeeList =
      MyObjectbox.store.box<EmployeeModel>().getAll();
}
