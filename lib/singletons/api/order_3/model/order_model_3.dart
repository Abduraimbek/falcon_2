///
/// Created by Abduraimbek Yarkinov at 21:16 on 21.12.2021.
///

import 'package:falcon_2/singletons/singletons.dart';

class OrderModel3 {
  String? postedBy;
  String? orderId;
  String? pickUpAt;
  String? pickUpDate;
  String? deliverTo;
  String? deliverDate;
  String? postDate;
  String? expiresDate;
  String? vehicle;
  String? miles;
  String? pieces;
  String? weight;
  String? orderLink;
  bool seen;
  int writeTime;
  int owner;

  OrderModel3({
    required this.postedBy,
    required this.deliverTo,
    required this.miles,
    required this.pickUpAt,
    required this.pickUpDate,
    required this.postDate,
    required this.vehicle,
    required this.weight,
    required this.pieces,
    required this.orderId,
    required this.deliverDate,
    required this.expiresDate,
    required this.orderLink,
    required this.seen,
    required this.writeTime,
    required this.owner,
  });

  factory OrderModel3.fromFalcon(OrderFalconModel orderFalconModel) {
    return OrderModel3(
      postedBy: orderFalconModel.postedBy,
      deliverTo: orderFalconModel.deliverTo,
      miles: orderFalconModel.miles,
      pickUpAt: orderFalconModel.pickUpAt,
      pickUpDate: orderFalconModel.pickUpDate,
      postDate: orderFalconModel.postDate,
      vehicle: orderFalconModel.vehicle,
      weight: orderFalconModel.weight,
      pieces: orderFalconModel.pieces,
      orderId: orderFalconModel.orderId,
      deliverDate: orderFalconModel.deliverDate,
      expiresDate: orderFalconModel.expiresDate,
      orderLink: orderFalconModel.orderLink,
      seen: orderFalconModel.seen,
      writeTime: orderFalconModel.writeTime,
      owner: orderFalconModel.owner,
    );
  }

  factory OrderModel3.fromAzam(OrderAzamModel orderAzamModel) {
    return OrderModel3(
      postedBy: orderAzamModel.postedBy,
      deliverTo: orderAzamModel.deliverTo,
      miles: orderAzamModel.miles,
      pickUpAt: orderAzamModel.pickUpAt,
      pickUpDate: orderAzamModel.pickUpDate,
      postDate: orderAzamModel.postDate,
      vehicle: orderAzamModel.vehicle,
      weight: orderAzamModel.weight,
      pieces: orderAzamModel.pieces,
      orderId: orderAzamModel.orderId,
      deliverDate: orderAzamModel.deliverDate,
      expiresDate: orderAzamModel.expiresDate,
      orderLink: orderAzamModel.orderLink,
      seen: orderAzamModel.seen,
      writeTime: orderAzamModel.writeTime,
      owner: orderAzamModel.owner,
    );
  }
}

// factory OrderModel3.nullModel() {
//   return OrderModel3(
//     postedBy: null,
//     deliverTo: null,
//     miles: null,
//     pickUpAt: null,
//     pickUpDate: null,
//     postDate: null,
//     vehicle: null,
//     weight: null,
//     deliverDate: null,
//     expiresDate: null,
//     orderId: null,
//     pieces: null,
//     orderLink: null,
//     owner: 9,
//   );
// }
//
// factory OrderModel3.fromRowList(List<Element> row) {
//   final model = OrderModel3.nullModel();
//
//   final postedByContainer = row[0];
//   final postedByContainerItems = postedByContainer.children;
//   model.postedBy = postedByContainerItems[1]
//       .text
//       .replaceAll("\n", "")
//       .replaceAll(RegExp(r"\s+"), " ")
//       .replaceAll("VF", "")
//       .trim();
//
//   final orderIdContainer = row[2];
//   final orderIdContainerItems = orderIdContainer.children;
//   model.orderId =
//       orderIdContainerItems[0].text.replaceAll(RegExp(r"\s+"), "").trim();
//
//   final pickUpContainer = row[3].querySelector("tbody");
//   if (pickUpContainer != null) {
//     final pickUpContainerItems = pickUpContainer.children;
//     model.pickUpAt = pickUpContainerItems[0]
//         .text
//         .replaceAll("\n", "")
//         .replaceAll(RegExp(r"\s+"), " ")
//         .trim();
//     model.pickUpDate = pickUpContainerItems[1]
//         .text
//         .replaceAll("\n", "")
//         .replaceAll(RegExp(r"\s+"), " ")
//         .trim();
//   }
//
//   final deliverContainer = row[7];
//   final deliverItems = deliverContainer.innerHtml.split("<br>");
//   model.deliverTo = deliverItems[0];
//   model.deliverDate = deliverItems[1];
//
//   final postDateExpiresDateContainer = row[8];
//   final postDateExpiresDateItems =
//       postDateExpiresDateContainer.innerHtml.split("<br>");
//   model.postDate = postDateExpiresDateItems[0];
//   model.expiresDate = postDateExpiresDateItems[1];
//
//   final vehicleContainer = row[9];
//   final vehicleItems = vehicleContainer.innerHtml.split("<br>");
//   model.vehicle = vehicleItems[0];
//   model.miles = vehicleItems[1];
//
//   final piecesContainer = row[10];
//   final piecesItems = piecesContainer.innerHtml.split("<br>");
//   model.pieces = piecesItems[0];
//   model.weight = piecesItems[1];
//
//   final aElement = postedByContainer.querySelectorAll("a")[1];
//   final onClick = aElement.attributes["onclick"];
//   if (onClick != null) {
//     int start = onClick.indexOf("('") + 2;
//     int end = onClick.indexOf("', ");
//     model.orderLink = onClick.substring(start, end);
//   }
//
//   model.writeTime = DateTime.now().millisecondsSinceEpoch;
//   return model;
// }
//
// static List<OrderModel3> storeList(String html) {
//   final oddRows = parse(html).getElementsByClassName("table-odd-row");
//   final evenRows = parse(html).getElementsByClassName("table-even-row");
//
//   List<List<Element>> rowList = [];
//
//   for (final row in oddRows) {
//     final td = row.querySelectorAll("td");
//     if (td.length == 13) rowList.add(td);
//   }
//
//   for (final row in evenRows) {
//     final td = row.querySelectorAll("td");
//     if (td.length == 13) rowList.add(td);
//   }
//
//   final list = rowList.map((e) => OrderModel3.fromRowList(e)).toList();
//   return list;
// }
