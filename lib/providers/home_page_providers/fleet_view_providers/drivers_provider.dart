///
/// Created by Abduraimbek Yarkinov at 16:31 on 04.12.2021.
///

import 'dart:async';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final driverListProvider =
    StateNotifierProvider.autoDispose<_DriverListNotifier, List<DriverModel>>(
        (ref) {
  List<DriverModel> list =
      List.of(MyObjectbox.store.box<DriverModel>().getAll());
  list.sort((a, b) => (a.driverId ?? "").compareTo(b.driverId ?? ""));

  return _DriverListNotifier(list);
});

class _DriverListNotifier extends StateNotifier<List<DriverModel>> {
  _DriverListNotifier(this._driverList) : super(_driverList) {
    final stream = MyObjectbox.store.box<DriverModel>().query().watch();

    subscription = stream.listen((event) {
      _driverList = List.of(event.find());
      _driverList
          .sort((a, b) => (a.driverId ?? "").compareTo(b.driverId ?? ""));
      _filtering();
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  late StreamSubscription subscription;
  List<DriverModel> _driverList;
  String _idDriverNameLocation = "";
  int _status = -1;
  int _employeeId = -1;
  int _truckType = -1;

  void _filtering() {
    List<DriverModel> list = [];

    if (_status == 1 || _status == 0) {
      list = _driverList.where((element) => element.status == _status).toList();
    } else {
      list = _driverList;
    }

    if (_idDriverNameLocation.isNotEmpty) {
      list = list.where((element) {
        if (element.driverId == _idDriverNameLocation ||
            (element.firstName ?? "")
                .toLowerCase()
                .contains(_idDriverNameLocation) ||
            (element.lastName ?? "")
                .toLowerCase()
                .contains(_idDriverNameLocation) ||
            (element.location ?? "")
                .toLowerCase()
                .contains(_idDriverNameLocation)) {
          return true;
        } else {
          return false;
        }
      }).toList();
    }

    if (_employeeId != -1) {
      list =
          list.where((element) => element.employeeId == _employeeId).toList();
    }

    if (_truckType != -1) {
      list = list.where((element) => element.truckType == _truckType).toList();
    }

    state = list;
  }

  void searchByIdDriverNameLocation(String pattern) {
    _idDriverNameLocation = pattern.toLowerCase();
    _filtering();
  }

  void changeStatus(int status) {
    _status = status;
    _filtering();
  }

  void changeEmployeeId(int employeeId) {
    _employeeId = employeeId;
    _filtering();
  }

  void changeTruckType(int truckType) {
    _truckType = truckType;
    _filtering();
  }
}
