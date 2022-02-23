///
/// Created by Abduraimbek Yarkinov at 14:12 on 13.12.2021.
///

class EditEmployeeModel {
  int id;
  String fullName;
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

  EditEmployeeModel({
    required this.id,
    required this.fullName,
    required this.mail,
    required this.login,
    required this.password,
    required this.role,
    required this.aMail,
    required this.aPassword,
    required this.fMail,
    required this.fPassword,
    required this.isRoot,
    required this.isAccessEmployee,
    required this.isAccessDriver,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "full_name": fullName,
      "mail": mail,
      "login": login,
      "password": password,
      "role": role,
      "a_mail": aMail,
      "a_password": aPassword,
      "f_mail": fMail,
      "f_password": fPassword,
      "is_root": isRoot,
      "is_access_driver": isAccessDriver,
      "is_access_employee": isAccessEmployee,
    };
  }
}
