///
/// Created by Abduraimbek Yarkinov at 10:59 on 13.12.2021.
///

import 'dart:isolate';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:falcon_2/objectbox.g.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/widgets/dialogs.dart';

class EmployeeSingleton {
  static Future<void> deleteEmployee({
    required BuildContext context,
    required EmployeeModel employee,
  }) async {
    final result = await showYesNoDialog(
      context: context,
      message: "You're deleting employee ${employee.fullName}",
    );
    if (result) {
      showWaitingDialog(context);

      final deleteResult = await EmployeeApi.deleteEmployee(
        deleteEmployeeModel: DeleteEmployeeModel(
          id: employee.id,
          fullName: employee.fullName,
          mail: employee.mail,
          login: employee.login,
          password: employee.password,
          role: employee.role,
        ),
      );

      Navigator.pop(context);

      if (deleteResult) {
        EmployeeSingleton.getEmployees();
      }
    }
  }

  static bool _employeeDownloadingWorking = false;

  static Future getEmployees() async {
    if (!_employeeDownloadingWorking) {
      _employeeDownloadingWorking = true;

      final internet = await InternetConnectionChecker().hasConnection;

      if (internet) {
        ReceivePort receivePort = ReceivePort();
        final i =
            await Isolate.spawn(_getEmployeesIsolate, receivePort.sendPort);

        SendPort childSendPort = await receivePort.first;

        ReceivePort responsePort = ReceivePort();
        ByteData store = MyObjectbox.store.reference;
        childSendPort.send([
          store,
          responsePort.sendPort,
          MyPrefsFields.getList(),
        ]);

        await responsePort.first;
        responsePort.close();
        receivePort.close();
        i.kill();
      }

      _employeeDownloadingWorking = false;
    }
  }

  static Future _getEmployeesIsolate(SendPort mainSendPort) async {
    ReceivePort childReceivePort = ReceivePort();
    mainSendPort.send(childReceivePort.sendPort);

    await for (var message in childReceivePort) {
      ByteData byteData = message[0];
      SendPort replyPort = message[1];
      MyPrefsFields.setList(message[2]);

      final store = Store.fromReference(getObjectBoxModel(), byteData);

      await _getEmployeesBackgroundMethod(store);

      store.close();
      replyPort.send("");
      childReceivePort.close();
    }
  }

  static Future _getEmployeesBackgroundMethod(Store store) async {
    List<EmployeeModel>? employees = await EmployeeApi.getEmployees();

    if (employees != null) {
      final box = store.box<EmployeeModel>();
      box.removeAll();
      box.putMany(employees);
    }
  }
}
