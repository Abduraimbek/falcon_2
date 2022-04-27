import 'dart:async';

import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';

final viewingOrderIdProvider = StateProvider<String?>((ref) => null);

final listCountProvider =
    StateProvider<int>((ref) => ref.watch(orderListProvider4).length);

final orderListProvider4 =
    StateNotifierProvider<OrderListNotifier4, List<OrderModel4>>((ref) {
  var list = MyObjectbox.store.box<OrderModel4>().getAll();
  list = list.reversed.toList();

  return OrderListNotifier4(list, ref);
});

class OrderListNotifier4 extends StateNotifier<List<OrderModel4>> {
  OrderListNotifier4(this.list, this.ref) : super(list) {
    final stream = MyObjectbox.store.box<OrderModel4>().query().watch();
    _streamSubscription = stream.listen((event) {
      var lll = event.find();
      lll = lll.reversed.toList();
      list = lll;
      if (ref.read(viewingOrderIdProvider) == null) {
        setState();
      }
    });
  }

  late StreamSubscription _streamSubscription;
  List<OrderModel4> list;
  Ref ref;

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  void setState() {
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
    setState();
  }

  void selectVehicle(String value) {
    vehicle = value;
    setState();
  }

  void typeOrigin(String value) {
    origin = value;
    setState();
  }

  void typeDestination(String value) {
    destination = value;
    setState();
  }
}
