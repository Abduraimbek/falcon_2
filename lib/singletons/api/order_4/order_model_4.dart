import 'package:objectbox/objectbox.dart';

@Entity()
class OrderModel4 {
  int id = 0;

  // @Unique(onConflict: ConflictStrategy.replace)
  // final String mongoId;
  final String? link;
  final String? postedBy;
  final String? refNo;
  final String? orderId;
  final String? pickUpAt;
  final String? pickUpDate;
  final String? deliverTo;
  final String? deliverDate;
  final String? postDate;
  final String? expiresDate;
  final String? vehicle;
  final String? weight;
  final String? miles;
  final String? pieces;
  final String host;
  bool seen;

  OrderModel4({
    // required this.mongoId,
    required this.link,
    required this.postedBy,
    required this.refNo,
    required this.orderId,
    required this.pickUpAt,
    required this.pickUpDate,
    required this.deliverTo,
    required this.deliverDate,
    required this.postDate,
    required this.expiresDate,
    required this.vehicle,
    required this.weight,
    required this.pieces,
    required this.miles,
    required this.host,
    required this.seen,
  });

  factory OrderModel4.fromJson(json) {
    final model = OrderModel4(
      // mongoId: json["_id"] ?? "",
      link: json["link"],
      postedBy: json["postedBy"],
      refNo: json["refNo"],
      orderId: json["orderId"],
      pickUpAt: json["pickUpAt"],
      pickUpDate: json["pickUpDate"],
      deliverTo: json["deliverTo"],
      deliverDate: json["deliverDate"],
      postDate: json["postDate"],
      expiresDate: json["expiresDate"],
      vehicle: json["vehicle"],
      weight: json["weight"],
      pieces: json["pieces"],
      miles: json["miles"],
      host: json["host"] ?? "F",
      seen: false,
    );
    return model;
  }
}
