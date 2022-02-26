import 'dart:isolate';

import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/objectbox.g.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class OrderRepository4 {
  static void clear() {
    MyObjectbox.store.box<OrderModel4>().removeAll();
  }

  static void allSeen() {
    final list = MyObjectbox.store.box<OrderModel4>().getAll().map((e) {
      e.seen = true;
      return e;
    }).toList();
    MyObjectbox.store.box<OrderModel4>().putMany(list);
  }

  static void seen(OrderModel4 model) {
    if (model.seen) return;
    model.seen = true;
    MyObjectbox.store.box<OrderModel4>().put(model);
  }

  static Future getOrders() async {
    final internet = await InternetConnectionChecker().hasConnection;
    if (!internet) return;

    ReceivePort receivePort = ReceivePort();
    final i = await Isolate.spawn(_getOrdersIsolate, receivePort.sendPort);

    SendPort childSendPort = await receivePort.first;

    ReceivePort responsePort = ReceivePort();
    ByteData store = MyObjectbox.store.reference;
    childSendPort.send([
      store,
      receivePort.sendPort,
      MyPrefsFields.getList(),
    ]);

    await responsePort.first;
    responsePort.close();
    receivePort.close();
    i.kill();
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
    final list = await OrderApi4().getOrders();
    if (list != null && list.isNotEmpty) {
      store.box<OrderModel4>().putMany(list);
    }
  }
}
