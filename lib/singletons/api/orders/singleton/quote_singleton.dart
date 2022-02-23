// ///
// /// Created by Abduraimbek Yarkinov at 19:10 on 28.12.2021.
// ///
//
// import 'dart:isolate';
//
// import 'package:flutter/material.dart';
// import 'package:falcon/singletons/singletons.dart';
//
// class QuoteSingleton {
//   Future _quoteIsolate(SendPort mainSendPort) async {
//     ReceivePort childReceivePort = ReceivePort();
//     mainSendPort.send(childReceivePort.sendPort);
//
//     await for (var message in childReceivePort) {
//       SendPort replyPort = message[1];
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
//   Future<bool> _quoteBackground(QuoteModel2 quoteModel2) async {
//     final result = await QuoteApi.quote(quoteModel2: quoteModel2);
//     return result;
//   }
// }
