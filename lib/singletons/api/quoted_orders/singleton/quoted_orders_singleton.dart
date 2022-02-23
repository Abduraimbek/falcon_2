///
/// Created by Abduraimbek Yarkinov at 19:17 on 13.12.2021.
///

import 'dart:isolate';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/objectbox.g.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class QuotedOrdersSingleton {
  static bool _quotedOrdersDownloadingWorking = false;

  static Future getQuotedOrders() async {
    if (!_quotedOrdersDownloadingWorking) {
      _quotedOrdersDownloadingWorking = true;

      final internet = await InternetConnectionChecker().hasConnection;

      if (internet) {
        ReceivePort receivePort = ReceivePort();
        final i = await Isolate.spawn(_getOrdersIsolate, receivePort.sendPort);

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

      _quotedOrdersDownloadingWorking = false;
    }
  }

  static Future _getOrdersIsolate(SendPort mainSendPort) async {
    ReceivePort childReceivePort = ReceivePort();
    mainSendPort.send(childReceivePort.sendPort);

    await for (var message in childReceivePort) {
      ByteData byteData = message[0];
      SendPort replyPort = message[1];
      MyPrefsFields.setList(message[2]);

      final store = Store.fromReference(getObjectBoxModel(), byteData);

      await _getOrdersBackgroundMethod(store);

      store.close();
      replyPort.send("");
      childReceivePort.close();
    }
  }

  static Future _getOrdersBackgroundMethod(Store store) async {
    List<QuotedOrderModel>? newList = await QuotedOrdersApi.quotedOrders();

    if (newList != null) {
      final box = store.box<QuotedOrderModel>();
      final currentList = List.of(box.getAll());
      List<QuotedOrderModel> addList = [];
      for (var item in newList) {
        if (currentList.any((element) => element.id == item.id) == false) {
          addList.add(item);
        }
      }
      if (addList.isNotEmpty) {
        box.putMany(addList);
      }
    }
  }
}
