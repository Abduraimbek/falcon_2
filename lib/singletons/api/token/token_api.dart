///
/// Created by Abduraimbek Yarkinov at 18:55 on 08.01.2022.
///

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:falcon_2/singletons/singletons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenApi {
  static Future<bool> getTokens() async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}tokens");
      final headers = ApiConst.getHeaders();

      final response = await http.get(uri, headers: headers);
      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        List parsedList = parsed["data"] as List;
        if (parsedList.isNotEmpty) {
          String? azam;
          String? falcon;
          for (var e in parsedList) {
            if (e["company_id"] == 1) {
              azam = e["token"];
            }
            if (e["company_id"] == 2) {
              falcon = e["token"];
            }
          }
          final sh = await SharedPreferences.getInstance();
          await sh.setString("cookie_azam", azam ?? "");
          await sh.setString("cookie_falcon", falcon ?? "");
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  static Future<bool> postTokens() async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}tokens");
      final headers = ApiConst.postHeadersWithToken();

      final sh = await SharedPreferences.getInstance();
      final azam = sh.getString("cookie_azam") ?? "";
      final falcon = sh.getString("cookie_falcon") ?? "";
      final body = [
        {
          "id": 1,
          "token": azam,
          "company_id": 1,
        },
        {
          "id": 2,
          "token": falcon,
          "company_id": 2,
        },
      ];

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));
      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        return true;
      } else {
        log("token_api.dart --> postTokens --> response --> ${response.body}");
        return false;
      }
    } catch (e) {
      log("token_api.dart --> postTokens --> error --> $e");
      return false;
    }
  }
}
