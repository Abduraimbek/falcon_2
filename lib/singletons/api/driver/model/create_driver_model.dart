///
/// Created by Abduraimbek Yarkinov at 17:29 on 24.12.2021.
///

class CreateDriverModel {
  String firstName;
  String lastName;
  String mail;
  String phone;
  String driverId;
  String licenseNumber;
  int truckType;
  bool canGetLoadOffers;
  double weight;
  double height;
  double length;
  double width;
  String company;
  int employee;

  CreateDriverModel({
    required this.length,
    required this.height,
    required this.weight,
    required this.canGetLoadOffers,
    required this.truckType,
    required this.licenseNumber,
    required this.driverId,
    required this.phone,
    required this.lastName,
    required this.firstName,
    required this.mail,
    required this.width,
    required this.employee,
    required this.company,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "mail": mail,
      "phone": phone,
      "driver_id": driverId,
      "license_number": licenseNumber,
      "truck_type": truckType,
      "can_get_load_offers": canGetLoadOffers,
      "height": height,
      "weight": weight,
      "length": length,
      "width": width,
      "employee": employee,
      "company": company,
    };
  }
}
