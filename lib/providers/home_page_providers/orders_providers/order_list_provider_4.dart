import 'dart:async';

import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';

final orderListProvider4 =
    StateNotifierProvider<OrderListNotifier4, List<OrderModel4>>((ref) {
  return OrderListNotifier4(
      MyObjectbox.store.box<OrderModel4>().getAll().reversed.toList());
});

class OrderListNotifier4 extends StateNotifier<List<OrderModel4>> {
  OrderListNotifier4(this.list) : super(list) {
    final stream = MyObjectbox.store.box<OrderModel4>().query().watch();
    _streamSubscription = stream.listen((event) {
      list = event.find().reversed.toList();
      MyPrefs().setLastUpdateTime(DateTime.now().millisecondsSinceEpoch);
      _setState();
    });
  }

  late StreamSubscription _streamSubscription;
  List<OrderModel4> list;

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  void _setState() {
    orderId = orderId.toLowerCase();
    origin = origin.toLowerCase();
    destination = destination.toLowerCase();

    if (vehicle == "All") {
      state = list.where((element) {
        if (element.orderId!.toLowerCase().contains(orderId) &&
            element.pickUpAt!.toLowerCase().contains(origin) &&
            element.deliverTo!.toLowerCase().contains(destination)) {
          return true;
        } else {
          return false;
        }
      }).toList();
    } else {
      vehicle = vehicle.toLowerCase();
      state = list.where((element) {
        if (element.orderId!.toLowerCase().contains(orderId) &&
            element.pickUpAt!.toLowerCase().contains(origin) &&
            vehicle.contains(element.vehicle!.toLowerCase()) &&
            element.deliverTo!.toLowerCase().contains(destination)) {
          return true;
        } else {
          return false;
        }
      }).toList();
    }
  }

  String orderId = "";
  String vehicle = "All";
  String origin = "";
  String destination = "";

  void typeOrderId(String value) {
    orderId = value;
    _setState();
  }

  void selectVehicle(String value) {
    vehicle = value;
    _setState();
  }

  void typeOrigin(String value) {
    origin = value;
    _setState();
  }

  void typeDestination(String value) {
    destination = value;
    _setState();
  }
}
