///
/// Created by Abduraimbek Yarkinov at 20:01 on 11.12.2021.
///

import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/dialogs.dart';

final updateDriverDialogProvider =
    StateNotifierProvider.autoDispose<_UpdateDriverDialogNotifier, bool>((ref) {
  return _UpdateDriverDialogNotifier();
});

class _UpdateDriverDialogNotifier extends StateNotifier<bool> {
  _UpdateDriverDialogNotifier() : super(true) {
    storeDriverInfo();
  }

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
  String employeeName = "";
  int employeeId = 0;

  void storeDriverInfo() {
    firstName = driverModelDriverModel.firstName ?? "";
    lastName = driverModelDriverModel.lastName ?? "";
    mail = driverModelDriverModel.mail ?? "";
    phone = driverModelDriverModel.phone ?? "";
    driverId = driverModelDriverModel.driverId ?? "";
    licenseNumber = driverModelDriverModel.licenseNumber ?? "";
    truckType = driverModelDriverModel.truckType;
    canGetLoadOffers = driverModelDriverModel.canGetLoadOffers;
    weight = driverModelDriverModel.weight;
    height = driverModelDriverModel.height;
    length = driverModelDriverModel.length;
    width = driverModelDriverModel.width;
    company = driverModelDriverModel.company ?? "";
    employeeName = driverModelDriverModel.employeeName ?? "";
    employeeId = driverModelDriverModel.employeeId;
  }

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

  void typeCompany(String value) {
    company = value;
  }

  void selectEmployee(int value) {
    employeeId = value;
  }

  Future<void> pressUpdateDriverButton({
    required BuildContext context,
  }) async {
    showWaitingDialog(context);

    final driverModel = driverModelDriverModel;

    driverModel.firstName = firstName;
    driverModel.lastName = lastName;
    driverModel.mail = mail;
    driverModel.phone = phone;
    driverModel.driverId = driverId;
    driverModel.licenseNumber = licenseNumber;
    driverModel.truckType = truckType;
    driverModel.canGetLoadOffers = canGetLoadOffers;
    driverModel.weight = weight;
    driverModel.height = height;
    driverModel.length = length;
    driverModel.width = width;
    driverModel.company = company;
    driverModel.employeeId = employeeId;
    driverModel.employeeName = employeeName;

    final result = await DriverApi.updateDriver(driverModel: driverModel);

    Navigator.of(context).pop();

    if (result) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      DriverSingleton.getDrivers();
    }
  }
}
