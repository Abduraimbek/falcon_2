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
    final newOrders = await OrderApi4().getOrders();

    if (newOrders != null && newOrders.isNotEmpty) {
      final box = store.box<OrderModel4>();
      List<OrderModel4> currentOrders = box.getAll();

      List<OrderModel4> list = [...currentOrders];

      for (int i = 0; i < newOrders.length; i++) {
        if (newOrders[i].orderId != null) {
          if (currentOrders.any((e) => e.orderId == newOrders[i].orderId)) {
          } else {
            list.add(newOrders[i]);
          }
        }
      }

      if (list.isNotEmpty) {
        list = list.reversed.toList();
        box.putMany(list);
      }
    }

    store.close();
  }

  static Future<bool> _hasConnection() async {
    final result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}
