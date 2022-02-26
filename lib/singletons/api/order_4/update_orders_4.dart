import 'dart:async';

import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';

class UpdateOrders4 {
  static final UpdateOrders4 _updateOrders4 = UpdateOrders4._internal();

  UpdateOrders4._internal();

  factory UpdateOrders4() => _updateOrders4;

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(seconds: MyPrefsFields.updateSecond),
      (timer) {
        OrderRepository4.getOrders();
      },
    );
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
