///
/// Created by Abduraimbek Yarkinov at 16:05 on 07.12.2021.
///

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:falcon_2/singletons/singletons.dart';

class EmployeeApi {
  static Future<bool> createEmployee({
    required String fullName,
    required String mail,
    required String login,
    required String password,
    required int role,
    required bool isRoot,
    required bool isAccessDriver,
    required bool isAccessEmployee,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}employee");
      final headers = ApiConst.postHeadersWithToken();
      final body = jsonEncode({
        "full_name": fullName,
        "mail": mail,
        "login": login,
        "password": password,
        "role": role,
        "is_root": isRoot,
        "is_access_driver": isAccessDriver,
        "is_access_employee": isAccessEmployee,
      });

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        return true;
      } else {
        log("employee_api.dart --> createEmployee -->"
            " response --> ${response.body}");
        return false;
      }
    } catch (e) {
      log("employee_api.dart --> createEmployee --> error --> $e");
      return false;
    }
  }

  static Future<List<EmployeeModel>?> getEmployees() async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}employee");
      final headers = await ApiConst.getHeadersThread();

      final response = await http.get(uri, headers: headers);
      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));
      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        final List parsedList = parsed["data"];
        final list = parsedList.map((e) => EmployeeModel.fromJson(e)).toList();
        return list;
      } else {
        log("employee_api.dart --> getEmployees --> "
            "error --> ${response.body}");
      }
    } catch (e) {
      log("employee_api.dart --> getEmployees --> error --> $e");
    }
  }

  static Future<bool> deleteEmployee({
    required DeleteEmployeeModel deleteEmployeeModel,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}employee");
      final headers = ApiConst.postHeadersWithToken();
      final body = jsonEncode(deleteEmployeeModel.toJson());

      final response = await http.delete(
        uri,
        headers: headers,
        body: body,
      );
      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        return true;
      } else {
        log("employee_api.dart --> deleteEmployee -->"
            " response --> ${response.body}");
        return false;
      }
    } catch (e) {
      log("employee_api.dart --> deleteEmployee --> error --> $e");
      return false;
    }
  }

  static Future<bool> editEmployee({
    required EditEmployeeModel editEmployeeModel,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}employee");
      final headers = ApiConst.postHeadersWithToken();
      final body = jsonEncode(editEmployeeModel.toJson());

      final response = await http.put(
        uri,
        headers: headers,
        body: body,
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        return true;
      } else {
        log("employee_api.dart --> editEmployee --> "
            "response --> ${response.body}");
        return false;
      }
    } catch (e) {
      log("employee_api.dart --> editEmployee --> error --> $e");
      return false;
    }
  }
}
