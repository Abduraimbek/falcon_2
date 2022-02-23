///
/// Created by Abduraimbek Yarkinov at 15:18 on 23.12.2021.
///

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:falcon_2/singletons/singletons.dart';

final orderListProvider3 =
    StateNotifierProvider<_OrderList3Notifier, List<OrderModel3>>((ref) {
  var listFalcon = MyObjectbox.store.box<OrderFalconModel>().getAll();
  var listAzam = MyObjectbox.store.box<OrderAzamModel>().getAll();
  var idSet = <String>{""};
  List<OrderModel3> list = [];

  for (var e in listFalcon) {
    if (idSet.add(e.orderId ?? "")) {
      list.add(OrderModel3.fromFalcon(e));
    }
  }
  for (var e in listAzam) {
    if (idSet.add(e.orderId ?? "")) {
      list.add(OrderModel3.fromAzam(e));
    }
  }

  list.sort((a, b) => b.writeTime.compareTo(a.writeTime));

  return _OrderList3Notifier(
    list: list,
    listFalcon: listFalcon,
    listAzam: listAzam,
  );
});

class _OrderList3Notifier extends StateNotifier<List<OrderModel3>> {
  _OrderList3Notifier({
    required this.list,
    required this.listFalcon,
    required this.listAzam,
  }) : super(list) {
    final streamFalcon =
        MyObjectbox.store.box<OrderFalconModel>().query().watch();
    final streamAzam = MyObjectbox.store.box<OrderAzamModel>().query().watch();

    subscriptionFalcon = streamFalcon.listen((event) {
      listFalcon = event.find();
      _onStoreChanged();
    });

    subscriptionAzam = streamAzam.listen((event) {
      listAzam = event.find();
      _onStoreChanged();
    });
  }

  List<OrderModel3> list;
  List<OrderFalconModel> listFalcon;
  List<OrderAzamModel> listAzam;

  late StreamSubscription subscriptionFalcon;
  late StreamSubscription subscriptionAzam;

  @override
  void dispose() {
    subscriptionFalcon.cancel();
    subscriptionAzam.cancel();
    super.dispose();
  }

  void _onStoreChanged() {
    var idSet = <String>{""};
    list = [];
    for (var e in listFalcon) {
      if (idSet.add(e.orderId ?? "")) {
        list.add(OrderModel3.fromFalcon(e));
      }
    }
    for (var e in listAzam) {
      if (idSet.add(e.orderId ?? "")) {
        list.add(OrderModel3.fromAzam(e));
      }
    }

    list.sort((a, b) => b.writeTime.compareTo(a.writeTime));
    _setState();
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
