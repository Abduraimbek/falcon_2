///
/// Created by Abduraimbek Yarkinov at 15:12 on 30.12.2021.
///

import 'dart:isolate';
import 'dart:typed_data';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/objectbox.g.dart';
import 'dart:developer';

import 'package:falcon_2/utils/utils.dart';

class OrderAzamSingleton {
  static Future getOrders() async {
    ReceivePort receivePort = ReceivePort();
    final i = await Isolate.spawn(_getOrdersIsolate, receivePort.sendPort);

    Future<void>.delayed(const Duration(seconds: 4)).then((_) {
      try {
        i.kill();
      } catch (e) {
        log("Isolate kill error --> $e");
      }
    });

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
    final html = await OrderApi3.ordersFromSiteAzam();

    if (html != null) {
      List<OrderAzamModel> newList = OrderAzamModel.storeList(html);

      if (newList.isNotEmpty) {
        final box = store.box<OrderAzamModel>();
        List<OrderAzamModel> currentList = box.getAll();
        if (currentList.isEmpty) {
          box.putMany(newList);
        } else {
          List<OrderAzamModel> addList = newList.where((newItem) {
            if (currentList
                .any((currentItem) => currentItem.orderId == newItem.orderId)) {
              return false;
            } else {
              return true;
            }
          }).toList();

          box.putMany(addList);
        }
      }
    }
  }
}
