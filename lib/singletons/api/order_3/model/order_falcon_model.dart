// ///
// /// Created by Abduraimbek Yarkinov at 15:30 on 30.12.2021.
// ///
//
// import 'package:html/dom.dart';
// import 'package:html/parser.dart';
// import 'package:objectbox/objectbox.dart';
//
// @Entity()
// class OrderFalconModel {
//   int id = 0;
//   String? postedBy;
//   String? orderId;
//   String? pickUpAt;
//   String? pickUpDate;
//   String? deliverTo;
//   String? deliverDate;
//   String? postDate;
//   String? expiresDate;
//   String? vehicle;
//   String? miles;
//   String? pieces;
//   String? weight;
//   String? orderLink;
//   int writeTime;
//   bool seen;
//   int owner;
//
//   OrderFalconModel({
//     required this.postedBy,
//     required this.orderId,
//     required this.pickUpAt,
//     required this.pickUpDate,
//     required this.deliverTo,
//     required this.deliverDate,
//     required this.postDate,
//     required this.expiresDate,
//     required this.vehicle,
//     required this.miles,
//     required this.pieces,
//     required this.weight,
//     required this.orderLink,
//     this.seen = false,
//     this.writeTime = 0,
//     this.owner = 9,
//   });
//
//   factory OrderFalconModel.nullModel() {
//     return OrderFalconModel(
//       postedBy: null,
//       orderId: null,
//       pickUpAt: null,
//       pickUpDate: null,
//       deliverTo: null,
//       deliverDate: null,
//       postDate: null,
//       expiresDate: null,
//       vehicle: null,
//       miles: null,
//       pieces: null,
//       weight: null,
//       orderLink: null,
//     );
//   }
//
//   factory OrderFalconModel.fromRowList(List<Element> row) {
//     final model = OrderFalconModel.nullModel();
//
//     final postedByContainer = row[0];
//     final postedByContainerItems = postedByContainer.children;
//     model.postedBy = postedByContainerItems[1]
//         .text
//         .replaceAll("\n", "")
//         .replaceAll(RegExp(r"\s+"), " ")
//         .replaceAll("VF", "")
//         .trim();
//
//     final orderIdContainer = row[2];
//     final orderIdContainerItems = orderIdContainer.children;
//     model.orderId =
//         orderIdContainerItems[0].text.replaceAll(RegExp(r"\s+"), "").trim();
//
//     final pickUpContainer = row[3].querySelector("tbody");
//     if (pickUpContainer != null) {
//       final pickUpContainerItems = pickUpContainer.children;
//       model.pickUpAt = pickUpContainerItems[0]
//           .text
//           .replaceAll("\n", "")
//           .replaceAll(RegExp(r"\s+"), " ")
//           .trim();
//       model.pickUpDate = pickUpContainerItems[1]
//           .text
//           .replaceAll("\n", "")
//           .replaceAll(RegExp(r"\s+"), " ")
//           .trim();
//     }
//
//     final deliverContainer = row[7];
//     final deliverItems = deliverContainer.innerHtml.split("<br>");
//     model.deliverTo = deliverItems[0];
//     model.deliverDate = deliverItems[1];
//
//     final postDateExpiresDateContainer = row[8];
//     final postDateExpiresDateItems =
//         postDateExpiresDateContainer.innerHtml.split("<br>");
//     model.postDate = postDateExpiresDateItems[0];
//     model.expiresDate = postDateExpiresDateItems[1];
//
//     final vehicleContainer = row[9];
//     final vehicleItems = vehicleContainer.innerHtml.split("<br>");
//     model.vehicle = vehicleItems[0];
//     model.miles = vehicleItems[1];
//
//     final piecesContainer = row[10];
//     final piecesItems = piecesContainer.innerHtml.split("<br>");
//     model.pieces = piecesItems[0];
//     model.weight = piecesItems[1];
//
//     final aElement = postedByContainer.querySelectorAll("a")[1];
//     final onClick = aElement.attributes["onclick"];
//     if (onClick != null) {
//       int start = onClick.indexOf("('") + 2;
//       int end = onClick.indexOf("', ");
//       model.orderLink = onClick.substring(start, end);
//     }
//
//     model.writeTime = DateTime.now().millisecondsSinceEpoch;
//     return model;
//   }
//
//   static List<OrderFalconModel> storeList(String html) {
//     final oddRows = parse(html).getElementsByClassName("table-odd-row");
//     final evenRows = parse(html).getElementsByClassName("table-even-row");
//
//     List<List<Element>> rowList = [];
//
//     for (final row in oddRows) {
//       final td = row.querySelectorAll("td");
//       if (td.length == 13) rowList.add(td);
//     }
//
//     for (final row in evenRows) {
//       final td = row.querySelectorAll("td");
//       if (td.length == 13) rowList.add(td);
//     }
//
//     final list = rowList.map((e) => OrderFalconModel.fromRowList(e)).toList();
//     return list;
//   }
// }
