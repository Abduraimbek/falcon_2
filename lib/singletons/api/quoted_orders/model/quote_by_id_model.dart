///
/// Created by Abduraimbek Yarkinov at 19:47 on 14.12.2021.
///

class QuoteByIdModel {
  int? id;
  int? orderId;
  double? quotePrice;
  double? additionalCharges;
  double? pricePerMile;
  double? milesOut;
  String? comments;
  String? vehicleType;
  String? width;
  String? height;
  String? length;
  int? template;
  String additionalParameters;
  String? seenAt;
  QuoteByIdOrderModel? order;

  QuoteByIdModel({
    required this.id,
    required this.orderId,
    required this.quotePrice,
    required this.additionalCharges,
    required this.pricePerMile,
    required this.milesOut,
    required this.comments,
    required this.vehicleType,
    required this.width,
    required this.height,
    required this.length,
    required this.template,
    required this.additionalParameters,
    required this.seenAt,
    required this.order,
  });

  factory QuoteByIdModel.fromJson(dynamic json) {
    final List list = json["additional_parametrs"];
    String add = "";
    for (var e in list) {
      add += "\n";
      add += e["name"];
    }

    return QuoteByIdModel(
      id: json["id"],
      orderId: json["order_id"],
      quotePrice: (json["quote_price"] as num?)?.toDouble(),
      additionalCharges: (json["additional_charges"] as num?)?.toDouble(),
      pricePerMile: (json["price_per_mile"] as num?)?.toDouble(),
      milesOut: (json["miles_out"] as num?)?.toDouble(),
      comments: json["comments"],
      vehicleType: json["vehicle_type"],
      width: json["width"],
      height: json["height"],
      length: json["length"],
      template: json["template"],
      seenAt: json["seen_at"],
      additionalParameters: add,
      order: QuoteByIdOrderModel.fromJson(json["order"]),
    );
  }
}

class QuoteByIdOrderModel {
  int? id;
  String? requestRef;
  String? postedBy;
  String? vehicleType;
  String? origin;
  String? pickUpDateCent;
  String? pickUpDateEst;
  String? destination;
  String? deliveryDateCen;
  String? deliveryDateEst;
  String? totalMiles;
  String? weight;
  String? pieces;
  String? suggestedTruckSize;
  String? dims;
  String? stackable;
  String? hazardous;
  String? fastLoad;
  String? dockLevel;
  String? notes;

  QuoteByIdOrderModel({
    required this.id,
    required this.requestRef,
    required this.postedBy,
    required this.vehicleType,
    required this.origin,
    required this.pickUpDateCent,
    required this.pickUpDateEst,
    required this.destination,
    required this.deliveryDateCen,
    required this.deliveryDateEst,
    required this.totalMiles,
    required this.weight,
    required this.pieces,
    required this.suggestedTruckSize,
    required this.dims,
    required this.stackable,
    required this.hazardous,
    required this.fastLoad,
    required this.dockLevel,
    required this.notes,
  });

  factory QuoteByIdOrderModel.fromJson(dynamic json) {
    return QuoteByIdOrderModel(
      id: json["id"],
      requestRef: json["request_ref"],
      postedBy: json["posted_by"],
      vehicleType: json["vehicle_type"],
      origin: json["origin"],
      pickUpDateCent: json["pick_up_date_cen"],
      pickUpDateEst: json["pick_up_date_est"],
      destination: json["destination"],
      deliveryDateCen: json["delivery_date_cen"],
      deliveryDateEst: json["delivery_date_est"],
      totalMiles: json["total_miles"],
      weight: json["weight"],
      pieces: json["pieces"],
      suggestedTruckSize: json["suggested_truck_size"],
      dims: json["dims"],
      stackable: json["stackable"],
      hazardous: json["hazardous"],
      fastLoad: json["fast_load"],
      dockLevel: json["dock_level"],
      notes: json["notes"],
    );
  }
}
