///
/// Created by Abduraimbek Yarkinov at 13:02 on 13.12.2021.
///

class DeleteEmployeeModel {
  int id;
  String fullName;
  String mail;
  String login;
  String password;
  int role;

  DeleteEmployeeModel({
    required this.id,
    required this.fullName,
    required this.mail,
    required this.login,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "full_name": fullName,
      "mail": mail,
      "login": login,
      "password": password,
      "role": role,
    };
  }
}
