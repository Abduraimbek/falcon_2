///
/// Created by Abduraimbek Yarkinov at 14:49 on 08.12.2021.
///

class NearbyDriverModel {
  int? id;
  String? firstName;
  String? lastName;
  String? mail;
  String? phone;
  String? driverId;
  double? distance;
  double? lat;
  double? long;
  String? notes;

  NearbyDriverModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mail,
    required this.phone,
    required this.driverId,
    required this.distance,
    required this.lat,
    required this.long,
    required this.notes,
  });

  factory NearbyDriverModel.fromJson(dynamic json) {
    return NearbyDriverModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      mail: json["mail"],
      phone: json["phone"],
      driverId: json["driver_id"],
      distance: (json["distance"] as num).toDouble(),
      lat: (json["latitude"] as num).toDouble(),
      long: (json["longitude"] as num).toDouble(),
      notes: json["notes"],
    );
  }
}
