///
/// Created by Abduraimbek Yarkinov at 19:08 on 13.12.2021.
///

import 'dart:async';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quotedOrdersProvider = ChangeNotifierProvider<_QuotedOrders>((ref) {
  final list = List.of(MyObjectbox.store.box<QuotedOrderModel>().getAll());
  list.sort((a, b) => (b.createdDate ?? "").compareTo(a.createdDate ?? ""));
  int notifications = 0;
  for (final e in list) {
    notifications += e.notificationCount;
  }

  return _QuotedOrders(
    orders: list,
    notifications: notifications,
  );
});

class _QuotedOrders extends ChangeNotifier {
  _QuotedOrders({
    required this.orders,
    required this.notifications,
  }) : _privateOrders = orders {
    final stream = MyObjectbox.store.box<QuotedOrderModel>().query().watch();

    subscription = stream.listen((event) {
      _privateOrders = List.of(event.find());
      _privateOrders
          .sort((a, b) => (b.createdDate ?? "").compareTo(a.createdDate ?? ""));
      notifications = 0;
      for (final e in _privateOrders) {
        notifications += e.notificationCount;
      }
      _filter();
    });
  }

  void _filter() {
    orders = _privateOrders.where((order) {
      if ((order.requestRef ?? "").toLowerCase().contains(_refId) &&
          (order.origin ?? "").toLowerCase().contains(_origin) &&
          (order.destination ?? "").toLowerCase().contains(_destination)) {
        return true;
      } else {
        return false;
      }
    }).toList();

    notifyListeners();
  }

  late StreamSubscription subscription;
  List<QuotedOrderModel> orders;
  List<QuotedOrderModel> _privateOrders;
  int notifications;
  String _refId = "";
  String _origin = "";
  String _destination = "";

  void typeRefId(String pattern) {
    _refId = pattern.toLowerCase();
    _filter();
  }

  void typeOrigin(String pattern) {
    _origin = pattern.toLowerCase();
    _filter();
  }

  void typeDestination(String pattern) {
    _destination = pattern.toLowerCase();
    _filter();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void notificationSeenOnOrder(QuotedOrderModel quotedOrderModel) {
    quotedOrderModel.notificationCount = 0;
    MyObjectbox.store.box<QuotedOrderModel>().put(quotedOrderModel);
  }
}
