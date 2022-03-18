import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/objectbox.g.dart';

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

  static bool _gettingWorking = false;

  static Future<void> getOrdersInBackground() async {
    if (_gettingWorking == false) {
      _gettingWorking = true;

      final internet = await _hasConnection();

      if (internet) {
        await MyObjectbox.store.runIsolated(TxMode.write, _newItems, "");
      }

      _gettingWorking = false;
    }
  }

  static Future<void> _newItems(Store store, String str) async {
    final orders = await OrderApi4().getOrders();

    if (orders != null && orders.isNotEmpty) {
      final box = store.box<OrderModel4>();
      List<OrderModel4> currentOrders = box.getAll();

      List<OrderModel4> listForPutStore = [];

      for (int i = 0; i < orders.length; i++) {
        if (currentOrders
            .any((e) => e.orderId == orders[i].orderId && e.seen)) {
          orders[i].seen = true;

          listForPutStore.add(orders[i]);
        } else {
          listForPutStore.insert(0, orders[i]);
        }
      }

      box
        ..removeAll()
        ..putMany(listForPutStore);
    }

    store.close();
  }

  // static Future getOrders() async {
  //   final internet = await InternetConnectionChecker().hasConnection;
  //   if (!internet) return;
  //
  //   ReceivePort receivePort = ReceivePort();
  //   final i = await Isolate.spawn(_getOrdersIsolate, receivePort.sendPort);
  //
  //   SendPort childSendPort = await receivePort.first;
  //
  //   ReceivePort responsePort = ReceivePort();
  //   ByteData store = MyObjectbox.store.reference;
  //   childSendPort.send([
  //     store,
  //     receivePort.sendPort,
  //     MyPrefsFields.getList(),
  //   ]);
  //
  //   await responsePort.first;
  //   responsePort.close();
  //   receivePort.close();
  //   i.kill();
  // }
  //
  // static Future _getOrdersIsolate(SendPort mainSendPort) async {
  //   ReceivePort childReceivePort = ReceivePort();
  //   mainSendPort.send(childReceivePort.sendPort);
  //
  //   await for (var message in childReceivePort) {
  //     ByteData byteData = message[0];
  //     SendPort replyPort = message[1];
  //     MyPrefsFields.setList(message[2]);
  //
  //     final store = Store.fromReference(getObjectBoxModel(), byteData);
  //
  //     await _getOrdersBackgroundMethod(store);
  //
  //     store.close();
  //     replyPort.send("");
  //     childReceivePort.close();
  //   }
  // }
  //
  // static Future _getOrdersBackgroundMethod(Store store) async {
  //   final list = await OrderApi4().getOrders();
  //   if (list != null && list.isNotEmpty) {
  //     store.box<OrderModel4>().putMany(list);
  //   }
  // }

  static Future<bool> _hasConnection() async {
    final result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}
