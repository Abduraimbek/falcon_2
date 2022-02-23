///
/// Created by Abduraimbek Yarkinov at 16:49 on 08.12.2021.
///

class QuoteModel2 {
  String requestRef;
  String postedBy;
  String vehicleType;
  String origin;
  String destination;
  String totalMiles;
  String weight;
  int nearbyTrucks;
  int createdDate;
  String createdDateStr;
  int status;
  String mail;
  String subject;
  QuoteModel quote;

  QuoteModel2({
    required this.postedBy,
    required this.weight,
    required this.mail,
    required this.status,
    required this.destination,
    required this.origin,
    required this.vehicleType,
    required this.createdDate,
    required this.totalMiles,
    required this.requestRef,
    required this.createdDateStr,
    required this.nearbyTrucks,
    required this.subject,
    required this.quote,
  });

  Map<String, dynamic> toJson() {
    final json = {
      "request_ref": requestRef,
      "posted_by": postedBy,
      "vehicle_type": vehicleType,
      "origin": origin,
      "destination": destination,
      "total_miles": totalMiles,
      "weight": weight,
      "nearby_trucks": nearbyTrucks,
      "created_date": createdDate,
      "created_date_str": createdDateStr,
      "status": status,
      "mail": mail,
      "subject": subject,
      "quote": quote.toJson(),
    };

    return json;
  }
}

class QuoteModel {
  double quotePrice;
  double additionalCharges;
  double pricePerMile;
  double milesOut;
  String timeToPickup;
  String comments;
  String vehicleType;
  double width;
  double height;
  double length;
  int template;
  List<int> additionalParameters;
  int orderId;

  QuoteModel({
    required this.quotePrice,
    required this.additionalCharges,
    required this.pricePerMile,
    required this.milesOut,
    required this.timeToPickup,
    required this.comments,
    required this.vehicleType,
    required this.width,
    required this.height,
    required this.length,
    required this.additionalParameters,
    required this.template,
    required this.orderId,
  });

  Map<String, dynamic> toJson() {
    final parametersJson = additionalParameters
        .map((e) => {
              "additional_parametr": e,
            })
        .toList();

    final json = {
      "quote_price": quotePrice,
      "additional_charges": additionalCharges,
      "price_per_mile": pricePerMile,
      "miles_out": milesOut,
      "time_to_pickup": timeToPickup,
      "comments": comments,
      "vehicle_type": vehicleType,
      "width": width.toString(),
      "height": height.toString(),
      "length": length.toString(),
      "additional_parametrs": parametersJson,
      "template": template,
      "order_id": orderId,
    };

    return json;
  }
}
