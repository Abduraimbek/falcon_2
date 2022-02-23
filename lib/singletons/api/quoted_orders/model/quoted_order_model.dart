///
/// Created by Abduraimbek Yarkinov at 19:09 on 13.12.2021.
///

import 'package:objectbox/objectbox.dart';

@Entity()
class QuotedOrderModel {
  @Id(assignable: true)
  int id;
  String? requestRef;
  String? postedBy;
  String? vehicleType;
  String? origin;
  String? destination;
  String? totalMiles;
  String? weight;
  double price;
  String? seenAt;
  int notificationCount;
  String? mail;
  String? subject;
  String? createdDate;

  QuotedOrderModel({
    required this.id,
    required this.requestRef,
    required this.postedBy,
    required this.vehicleType,
    required this.origin,
    required this.destination,
    required this.totalMiles,
    required this.weight,
    required this.price,
    required this.seenAt,
    required this.notificationCount,
    required this.mail,
    required this.subject,
    required this.createdDate,
  });

  factory QuotedOrderModel.fromJson(dynamic json) {
    return QuotedOrderModel(
      id: json["id"],
      requestRef: json["request_ref"],
      postedBy: json["posted_by"],
      vehicleType: json["vehicle_type"],
      origin: json["origin"],
      destination: json["destination"],
      totalMiles: json["total_miles"],
      weight: json["weight"],
      price: (json["price"] as num?)?.toDouble() ?? 0,
      seenAt: json["seen_at"],
      notificationCount: 0,
      mail: json["mail"],
      subject: json["subject"],
      createdDate: json["created_date"],
    );
  }
}
