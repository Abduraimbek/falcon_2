///
/// Created by Abduraimbek Yarkinov at 10:47 on 04.12.2021.
///

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/dialogs.dart';

final createDriverDialogProvider =
    StateNotifierProvider.autoDispose<_CreateDriverDialogNotifier, bool>((ref) {
  return _CreateDriverDialogNotifier();
});

class _CreateDriverDialogNotifier extends StateNotifier<bool> {
  _CreateDriverDialogNotifier() : super(false);

  String firstName = "";
  String lastName = "";
  String mail = "";
  String phone = "";
  String driverId = "";
  String licenseNumber = "";
  int truckType = 1;
  bool canGetLoadOffers = false;
  double weight = 0;
  double height = 0;
  double length = 0;
  double width = 0;
  String company = "";
  int employee = 0;

  void _checkState() {
    if (firstName.length >= 3 &&
        lastName.length >= 3 &&
        mail.length >= 3 &&
        phone.length >= 3 &&
        driverId.length >= 3 &&
        licenseNumber.length >= 3) {
      state = true;
    } else {
      state = false;
    }
  }

  void typeWeight(String value) {
    weight = double.tryParse(value) ?? 0;
  }

  void typeWidth(String value) {
    width = double.tryParse(value) ?? 0;
  }

  void typeHeight(String value) {
    height = double.tryParse(value) ?? 0;
  }

  void typeLength(String value) {
    length = double.tryParse(value) ?? 0;
  }

  void typeFirstName(String value) {
    firstName = value;
    _checkState();
  }

  void typeCompany(String value) {
    company = value;
  }

  void selectEmployee(int value) {
    employee = value;
  }

  void typeLastName(String value) {
    lastName = value;
    _checkState();
  }

  void typeMail(String value) {
    mail = value;
    _checkState();
  }

  void typePhone(String value) {
    phone = value;
    _checkState();
  }

  void typeDriverId(String value) {
    driverId = value;
    _checkState();
  }

  void typeLicenseNumber(String value) {
    licenseNumber = value;
    _checkState();
  }

  void selectTruckType(int value) {
    truckType = value;
  }

  void changeCanGetLoadOffers(bool value) {
    canGetLoadOffers = value;
  }

  Future<void> pressCreateDriverButton({
    required BuildContext context,
  }) async {
    showWaitingDialog(context);

    final createDriverModel = CreateDriverModel(
      length: length,
      height: height,
      weight: weight,
      width: width,
      canGetLoadOffers: canGetLoadOffers,
      truckType: truckType,
      licenseNumber: licenseNumber,
      driverId: driverId,
      phone: phone,
      lastName: lastName,
      firstName: firstName,
      mail: mail,
      company: company,
      employee: employee,
    );

    final result =
        await DriverApi.createDriver(createDriverModel: createDriverModel);

    Navigator.of(context).pop();

    if (result) {
      DriverSingleton.getDrivers();
      Navigator.of(context).pop();
    }
  }
}
