// ///
// /// Created by Abduraimbek Yarkinov at 21:26 on 21.12.2021.
// ///
//
// import 'dart:isolate';
// import 'dart:typed_data';
// import 'package:falcon_2/singletons/singletons.dart';
// import 'package:falcon_2/objectbox.g.dart';
// import 'dart:developer';
//
// import 'package:falcon_2/utils/utils.dart';
//
// class OrderFalconSingleton {
//   static Future getOrders() async {
//     ReceivePort receivePort = ReceivePort();
//     final i = await Isolate.spawn(_getOrdersIsolate, receivePort.sendPort);
//
//     Future<void>.delayed(Duration(seconds: MyPrefsFields.updateSecond)).then(
//       (_) {
//         try {
//           i.kill();
//         } catch (e) {
//           log("Isolate kill error --> $e");
//         }
//       },
//     );
//
//     SendPort childSendPort = await receivePort.first;
//
//     ReceivePort responsePort = ReceivePort();
//     ByteData store = MyObjectbox.store.reference;
//     childSendPort.send([
//       store,
//       responsePort.sendPort,
//       MyPrefsFields.getList(),
//     ]);
//
//     await responsePort.first;
//     responsePort.close();
//     receivePort.close();
//   }
//
//   static Future _getOrdersIsolate(SendPort mainSendPort) async {
//     ReceivePort childReceivePort = ReceivePort();
//     mainSendPort.send(childReceivePort.sendPort);
//
//     await for (var message in childReceivePort) {
//       ByteData byteData = message[0];
//       SendPort replyPort = message[1];
//       MyPrefsFields.setList(message[2]);
//
//       final store = Store.fromReference(getObjectBoxModel(), byteData);
//
//       await _getOrdersBackgroundMethod(store);
//
//       store.close();
//       replyPort.send("");
//       childReceivePort.close();
//     }
//   }
//
//   static Future _getOrdersBackgroundMethod(Store store) async {
//     final html = await OrderApi3.ordersFromSiteFalcon();
//
//     if (html != null) {
//       List<OrderFalconModel> newList = OrderFalconModel.storeList(html);
//
//       if (newList.isNotEmpty) {
//         final box = store.box<OrderFalconModel>();
//         List<OrderFalconModel> currentList = box.getAll();
//         if (currentList.isEmpty) {
//           box.putMany(newList);
//         } else {
//           List<OrderFalconModel> addList = newList.where((newItem) {
//             if (currentList
//                 .any((currentItem) => currentItem.orderId == newItem.orderId)) {
//               return false;
//             } else {
//               return true;
//             }
//           }).toList();
//
//           box.putMany(addList);
//         }
//       }
//     }
//   }
//
//   static void seen(OrderModel3 orderModel) {
//     if (orderModel.seen) return;
//
//     if (orderModel.owner == 9) {
//       final box = MyObjectbox.store.box<OrderFalconModel>();
//       final query = box
//           .query(OrderFalconModel_.orderId.equals(orderModel.orderId ?? ""))
//           .build();
//
//       final item = query.findFirst();
//       if (item != null) {
//         item.seen = true;
//         box.put(item);
//       }
//       query.close();
//     } else {
//       final box = MyObjectbox.store.box<OrderAzamModel>();
//       final query = box
//           .query(OrderAzamModel_.orderId.equals(orderModel.orderId ?? ""))
//           .build();
//
//       final item = query.findFirst();
//       if (item != null) {
//         item.seen = true;
//         box.put(item);
//       }
//       query.close();
//     }
//   }
//
//   static void allSeen() {
//     List<OrderFalconModel> list =
//         MyObjectbox.store.box<OrderFalconModel>().getAll().map((e) {
//       e.seen = true;
//       return e;
//     }).toList();
//     MyObjectbox.store.box<OrderFalconModel>().putMany(list);
//
//     List<OrderAzamModel> list2 =
//         MyObjectbox.store.box<OrderAzamModel>().getAll().map((e) {
//       e.seen = true;
//       return e;
//     }).toList();
//     MyObjectbox.store.box<OrderAzamModel>().putMany(list2);
//   }
// }
