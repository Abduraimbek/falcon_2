///
/// Created by Abduraimbek Yarkinov at 17:59 on 03.12.2021.
///

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class DriverApi {
  static Future<bool> delete(int id) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}driver?id=$id");
      final headers = ApiConst.getHeaders();
      final response = await http.delete(
        uri,
        headers: headers,
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));
      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        return true;
      } else {
        log("driver_api.dart => drivers => response => ${response.body}");
        return false;
      }
    } catch (e) {
      log("driver_api.dart => delete => error => $e");
      return false;
    }
  }

  static Future<List<DriverModel>?> drivers() async {
    try {
      var dio = Dio();
      final uri = Uri.parse("${ApiConst.baseUrl}drivers");
      final headers = await ApiConst.getHeadersThread();

      final response = await dio.getUri(
        uri,
        options: Options(
          headers: headers,
          receiveTimeout: 3000,
          sendTimeout: 3000,
        ),
      );

      if (response.data["code"] == 0 && response.data["message"] == "OK") {
        final list = (response.data["data"] as List)
            .map((e) => DriverModel.fromJson(e))
            .toList();
        return list;
      } else {
        log("driver_api.dart => drivers => response => ${response.data}");
        return null;
      }
    } catch (e) {
      log("driver_api.dart => drivers => error => $e");
      return null;
    }
  }

  static Future<bool> createDriver({
    required CreateDriverModel createDriverModel,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}driver");
      final headers = ApiConst.postHeadersWithToken();
      final body = jsonEncode(createDriverModel.toJson());

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 &&
          parsed["message"] == "OK" &&
          parsed["data"]["first_name"] == createDriverModel.firstName) {
        return true;
      } else {
        log("driver_api.dart => createDriver => response => ${response.body}");
        return false;
      }
    } catch (e) {
      log("driver_api.dart => createDriver => error => $e");
      return false;
    }
  }

  static Future<bool> updateDriver({
    required DriverModel driverModel,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}driver");
      final headers = ApiConst.postHeadersWithToken();
      final body = jsonEncode(driverModel.toJson());

      final response = await http.put(
        uri,
        headers: headers,
        body: body,
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        return true;
      } else {
        log("driver_api.dart => updateDriver => response => ${response.body}");
        return false;
      }
    } catch (e) {
      log("driver_api.dart => updateDriver => error => $e");
      return false;
    }
  }

  static Future<bool> setLocation({
    required int id,
    required double lat,
    required double long,
  }) async {
    try {
      final location = await _getLocationName(lat, long);
      final uri = Uri.parse("${ApiConst.baseUrl}setDriverLocation?id=$id");
      final headers = ApiConst.postHeadersWithToken();
      final body = jsonEncode({
        "latitude": lat,
        "longitude": long,
        "location": location,
      });

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 &&
          parsed["message"] == "OK" &&
          parsed["data"] == "Succesfuly update!") {
        return true;
      } else {
        log("driver_api.dart => setLocation => response => ${response.body}");
        return false;
      }
    } catch (e) {
      log("driver_api.dart => setLocation => error => $e");
      return false;
    }
  }

  static Future<String> _getLocationName(
    double lat,
    double long,
  ) async {
    try {
      final uri = Uri.parse("https://maps.googleapis.com/maps/api/geocode/"
          "json?latlng=$lat,$long&key=${MyStrings.googleMapsKey}"
          "&sensor=false");

      final response = await http.get(uri);

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      return parsed["results"][0]["formatted_address"];
    } catch (e) {
      return "";
    }
  }
}
