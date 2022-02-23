///
/// Created by Abduraimbek Yarkinov at 15:29 on 11.12.2021.
///

import 'package:objectbox/objectbox.dart';

@Entity()
class EmployeeModel {
  @Id(assignable: true)
  int id;
  String fullName;
  bool status;
  String mail;
  String login;
  String password;
  int role;
  String aMail;
  String aPassword;
  String fMail;
  String fPassword;
  bool isRoot;
  bool isAccessDriver;
  bool isAccessEmployee;

  EmployeeModel({
    required this.id,
    required this.fullName,
    required this.status,
    required this.mail,
    required this.login,
    required this.password,
    required this.role,
    required this.aMail,
    required this.aPassword,
    required this.fMail,
    required this.fPassword,
    required this.isRoot,
    required this.isAccessDriver,
    required this.isAccessEmployee,
  });

  factory EmployeeModel.fromJson(dynamic json) {
    return EmployeeModel(
      id: json["id"],
      fullName: json["full_name"],
      status: json["status"],
      mail: json["mail"],
      password: json["password"],
      role: json["role"],
      login: json["login"],
      aMail: json["a_mail"],
      aPassword: json["a_password"],
      fMail: json["f_mail"],
      fPassword: json["f_password"],
      isRoot: json["is_root"] ?? false,
      isAccessDriver: json["is_access_driver"] ?? false,
      isAccessEmployee: json["is_access_employee"] ?? false,
    );
  }
}
