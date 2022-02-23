///
/// Created by Abduraimbek Yarkinov at 17:56 on 16.11.2021.
///

import 'package:dio/dio.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';

class LoginApi {
  static Future<bool?> signIn({
    required String login,
    required String password,
  }) async {
    try {
      var dio = Dio();
      final uri = Uri.parse("${ApiConst.baseUrl}signIn");
      final headers = ApiConst.postHeaders();

      final response = await dio.postUri(
        uri,
        options: Options(headers: headers),
        data: {"login": login, "password": password},
      );

      Future.wait([
        MyPrefs().setEmployeeName(response.data["data"]["full_name"]),
        MyPrefs().setEmployeeMail(response.data["data"]["mail"]),
        MyPrefs().setEmployeeRole(response.data["data"]["role"]),
        MyPrefs().setEmployeeToken(response.data["data"]["token"]),
        MyPrefs().setIsRoot(response.data["data"]["is_root"]),
        MyPrefs().setIsAccessDriver(response.data["data"]["is_access_driver"]),
        MyPrefs()
            .setIsAccessEmployee(response.data["data"]["is_access_employee"]),
        MyPrefs().setAMail(response.data["data"]["a_mail"] ?? ""),
        MyPrefs().setAPassword(response.data["data"]["a_password"] ?? ""),
        MyPrefs().setFMail(response.data["data"]["f_mail"] ?? ""),
        MyPrefs().setFPassword(response.data["data"]["f_password"] ?? ""),
      ]);

      return true;
    } catch (e) {
      return null;
    }
  }
}
