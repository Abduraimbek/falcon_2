///
/// Created by Abduraimbek Yarkinov at 15:31 on 13.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/widgets/dialogs.dart';

final editEmployeeDialogProvider =
    StateNotifierProvider.autoDispose<_EditEmployeeNotifier, bool>((ref) {
  return _EditEmployeeNotifier();
});

EmployeeModel? employeeModelEmployeeModel;

class _EditEmployeeNotifier extends StateNotifier<bool> {
  _EditEmployeeNotifier() : super(true) {
    storeEmployeeInfo();
  }

  int id = 0;
  String fullName = "";
  String mail = "";
  String login = "";
  String password = "";
  int role = 1;

  bool isRoot = false;
  bool isAccessDriver = false;
  bool isAccessEmployee = false;

  String aMail = "";
  String aPassword = "";
  String fMail = "";
  String fPassword = "";

  void setF(List<String> list) {
    fMail = list[0];
    fPassword = list[1];
  }

  void setA(List<String> list) {
    aMail = list[0];
    aPassword = list[1];
  }

  void storeEmployeeInfo() {
    if (employeeModelEmployeeModel != null) {
      id = employeeModelEmployeeModel!.id;
      fullName = employeeModelEmployeeModel!.fullName;
      mail = employeeModelEmployeeModel!.mail;
      login = employeeModelEmployeeModel!.login;
      password = employeeModelEmployeeModel!.password;
      role = employeeModelEmployeeModel!.role;
      isRoot = employeeModelEmployeeModel!.isRoot;
      isAccessDriver = employeeModelEmployeeModel!.isAccessDriver;
      isAccessEmployee = employeeModelEmployeeModel!.isAccessEmployee;
      aMail = employeeModelEmployeeModel!.aMail;
      aPassword = employeeModelEmployeeModel!.aPassword;
      fMail = employeeModelEmployeeModel!.fMail;
      fPassword = employeeModelEmployeeModel!.fPassword;
    }
  }

  void _checkState() {
    if (fullName.length >= 3 &&
        mail.length >= 3 &&
        login.length >= 3 &&
        password.length >= 3) {
      state = true;
    } else {
      state = false;
    }
  }

  void typeFullName(String value) {
    fullName = value;
    _checkState();
  }

  void typeMail(String value) {
    mail = value;
    _checkState();
  }

  void typeLogin(String value) {
    login = value;
    _checkState();
  }

  void typePassword(String value) {
    password = value;
    _checkState();
  }

  void changeIsRoot(bool value) {
    isRoot = value;
  }

  void changeIsAccessDriver(bool value) {
    isAccessDriver = value;
  }

  void changeIsAccessEmployee(bool value) {
    isAccessEmployee = value;
  }

  Future<void> pressEditEmployeeButton({
    required BuildContext context,
  }) async {
    showWaitingDialog(context);

    final editEmployeeModel = EditEmployeeModel(
      id: id,
      fullName: fullName,
      mail: mail,
      login: login,
      password: password,
      role: role,
      aMail: aMail,
      aPassword: aPassword,
      fMail: fMail,
      fPassword: fPassword,
      isRoot: isRoot,
      isAccessDriver: isAccessDriver,
      isAccessEmployee: isAccessEmployee,
    );

    final result =
        await EmployeeApi.editEmployee(editEmployeeModel: editEmployeeModel);

    Navigator.pop(context);

    if (result) {
      Navigator.pop(context);
      EmployeeSingleton.getEmployees();
    }
  }
}
