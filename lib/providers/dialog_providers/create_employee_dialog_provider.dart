///
/// Created by Abduraimbek Yarkinov at 16:02 on 07.12.2021.
///

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/widgets/dialogs.dart';

final createEmployeeDialogProvider =
    StateNotifierProvider.autoDispose<_CreateEmployeeDialogNotifier, bool>(
        (ref) {
  return _CreateEmployeeDialogNotifier();
});

class _CreateEmployeeDialogNotifier extends StateNotifier<bool> {
  _CreateEmployeeDialogNotifier() : super(false);

  String fullName = "";
  String mail = "";
  String login = "";
  String password = "";
  int role = 1;
  bool isRoot = false;
  bool isAccessDriver = false;
  bool isAccessEmployee = false;

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

  Future<void> pressCreateEmployeeButton({
    required BuildContext context,
  }) async {
    final message = "You're creating a client with follows:\n\n"
        "Full name: $fullName\n"
        "Email: $mail\n"
        "Login: $login\n"
        "Password: $password\n"
        "is_root: $isRoot\n"
        "is_access_driver: $isAccessDriver\n"
        "is_access_employee: $isAccessEmployee";
    final yesNoResult = await showYesNoDialog(
      context: context,
      message: message,
    );

    if (yesNoResult) {
      showWaitingDialog(context);

      final result = await EmployeeApi.createEmployee(
        fullName: fullName,
        mail: mail,
        login: login,
        password: password,
        role: role,
        isRoot: isRoot,
        isAccessDriver: isAccessDriver,
        isAccessEmployee: isAccessEmployee,
      );

      Navigator.of(context).pop();

      if (result) {
        Navigator.of(context).pop(true);
      }
    }
  }
}
