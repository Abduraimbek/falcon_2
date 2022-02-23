///
/// Created by Abduraimbek Yarkinov at 16:03 on 04.12.2021.
///

import 'dart:isolate';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/objectbox.g.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DriverSingleton {
  static bool _driversDownloadingWorking = false;

  static Future getDrivers() async {
    if (!_driversDownloadingWorking) {
      _driversDownloadingWorking = true;

      final internet = await InternetConnectionChecker().hasConnection;

      if (internet) {
        ReceivePort receivePort = ReceivePort();
        final i = await Isolate.spawn(_getDriversIsolate, receivePort.sendPort);

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

      _driversDownloadingWorking = false;
    }
  }

  static Future _getDriversIsolate(SendPort mainSendPort) async {
    ReceivePort childReceivePort = ReceivePort();
    mainSendPort.send(childReceivePort.sendPort);

    await for (var message in childReceivePort) {
      ByteData byteData = message[0];
      SendPort replyPort = message[1];
      MyPrefsFields.setList(message[2]);

      final store = Store.fromReference(getObjectBoxModel(), byteData);

      await _getDriversBackgroundMethod(store);

      store.close();
      replyPort.send("");
      childReceivePort.close();
    }
  }

  static Future _getDriversBackgroundMethod(Store store) async {
    List<DriverModel>? drivers = await DriverApi.drivers();

    if (drivers != null) {
      final box = store.box<DriverModel>();
      box.removeAll();
      box.putMany(drivers);
    }
  }
}
