///
/// Created by Abduraimbek Yarkinov at 18:00 on 03.12.2021.
///

import 'package:falcon_2/utils/utils.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DriverModel {
  @Id(assignable: true)
  int id;
  String? firstName;
  String? lastName;
  String? mail;
  String? phone;
  String? license;
  String? driverId;
  String? licenseNumber;
  int truckType;
  int status;
  double latitude;
  double longitude;
  String? location;
  String? appVersion;
  String? lastActive;
  bool canGetLoadOffers;
  String? carrier;
  String? token;
  double height;
  double weight;
  double length;
  double width;
  String? notes;
  String? company;
  String? employeeName;
  int employeeId;

  DriverModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mail,
    required this.phone,
    required this.license,
    required this.driverId,
    required this.licenseNumber,
    required this.truckType,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.appVersion,
    required this.lastActive,
    required this.canGetLoadOffers,
    required this.carrier,
    required this.token,
    required this.height,
    required this.weight,
    required this.length,
    required this.notes,
    required this.width,
    required this.company,
    required this.employeeName,
    required this.employeeId,
  });

  factory DriverModel.nullModel() {
    return DriverModel(
        id: 0,
        firstName: null,
        lastName: null,
        mail: null,
        phone: null,
        license: null,
        driverId: null,
        licenseNumber: null,
        truckType: 0,
        status: 0,
        latitude: 0,
        longitude: 0,
        location: null,
        appVersion: null,
        lastActive: null,
        canGetLoadOffers: false,
        carrier: null,
        token: null,
        height: 0,
        weight: 0,
        length: 0,
        width: 0,
        notes: null,
        employeeName: null,
        employeeId: 0,
        company: null);
  }

  factory DriverModel.fromJson(dynamic json) {
    return DriverModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      mail: json["mail"],
      phone: json["phone"],
      license: json["license"],
      driverId: json["driver_id"],
      licenseNumber: json["license_number"],
      truckType: json["truck_type"] ?? 1,
      status: json["status"] ?? 0,
      latitude: (json["latitude"] as num?)?.toDouble() ?? MyNums.newYorkLat,
      longitude: (json["longitude"] as num?)?.toDouble() ?? MyNums.newYorkLong,
      location: json["location"],
      appVersion: json["app_version"],
      lastActive: json["last_active"],
      canGetLoadOffers: json["can_get_load_offers"] ?? false,
      carrier: json["carrier"],
      token: json["token"],
      height: (json["height"] as num?)?.toDouble() ?? 0,
      weight: (json["weight"] as num?)?.toDouble() ?? 0,
      length: (json["length"] as num?)?.toDouble() ?? 0,
      width: (json["width"] as num?)?.toDouble() ?? 0,
      notes: json["notes"],
      company: json["company"],
      employeeName: json["employee"],
      employeeId: int.tryParse(json["employee_id"]) ?? 0,
    );
  }

  void toGlobalModel(DriverModel driverModel) {
    driverModelDriverModel = DriverModel(
      id: driverModel.id,
      firstName: driverModel.firstName,
      lastName: driverModel.lastName,
      mail: driverModel.mail,
      phone: driverModel.phone,
      license: driverModel.license,
      driverId: driverModel.driverId,
      licenseNumber: driverModel.licenseNumber,
      truckType: driverModel.truckType,
      status: driverModel.status,
      latitude: driverModel.latitude,
      longitude: driverModel.longitude,
      location: driverModel.location,
      appVersion: driverModel.appVersion,
      lastActive: driverModel.lastActive,
      canGetLoadOffers: driverModel.canGetLoadOffers,
      carrier: driverModel.carrier,
      token: driverModel.token,
      height: driverModel.height,
      weight: driverModel.weight,
      length: driverModel.length,
      width: driverModel.width,
      notes: driverModel.notes,
      employeeId: driverModel.employeeId,
      employeeName: driverModel.employeeName,
      company: driverModel.company,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "mail": mail,
      "phone": phone,
      "license": license,
      "driver_id": driverId,
      "license_number": licenseNumber,
      "truck_type": truckType,
      "status": status,
      "latitude": latitude,
      "longitude": longitude,
      "location": location,
      "app_version": appVersion,
      "last_active": lastActive,
      "can_get_load_offers": canGetLoadOffers,
      "carrier": carrier,
      "token": token,
      "height": height,
      "weight": weight,
      "length": length,
      "width": width,
      "notes": notes,
      "company": company,
      "employee": employeeId,
    };
  }

  DriverModel copyWith({int? status}) {
    return DriverModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      mail: mail,
      phone: phone,
      license: license,
      driverId: driverId,
      licenseNumber: licenseNumber,
      truckType: truckType,
      status: status ?? this.status,
      latitude: latitude,
      longitude: longitude,
      location: location,
      appVersion: appVersion,
      lastActive: lastActive,
      canGetLoadOffers: canGetLoadOffers,
      carrier: carrier,
      token: token,
      height: height,
      weight: weight,
      length: length,
      notes: notes,
      width: width,
      company: company,
      employeeName: employeeName,
      employeeId: employeeId,
    );
  }
}

DriverModel driverModelDriverModel = DriverModel.nullModel();
