// import 'dart:async';
//
// import 'package:falcon_2/utils/utils.dart';
// import 'package:falcon_2/singletons/singletons.dart';
//
// class UpdateRepository {
//   static final UpdateRepository _updateRepository =
//       UpdateRepository._internal();
//
//   UpdateRepository._internal();
//
//   factory UpdateRepository() => _updateRepository;
//
//   Timer? _timer;
//
//   void startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(
//       Duration(seconds: MyPrefsFields.updateSecond),
//       (timer) {
//         OrderFalconSingleton.getOrders();
//         OrderAzamSingleton.getOrders();
//       },
//     );
//   }
//
//   void dispose() {
//     _timer?.cancel();
//     _timer = null;
//   }
// }
