///
/// Created by Abduraimbek Yarkinov at 14:57 on 08.12.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'dart:convert';
import 'package:falcon_2/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:latlong2/latlong.dart';

class MyNearbyDriversClass {
  static Future<List<NearbyDriverModel>> drivers({
    required String origin,
  }) async {
    try {
      final uri = Uri.parse("https://nominatim.openstreetmap.org/"
          "search.php?q=$origin&format=jsonv2");

      final response = await http.get(uri);

      if (response.statusCode != 200) return [];
      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      List list = parsed;

      if (list.isNotEmpty) {
        LatLng latLng = LatLng(
          double.tryParse(list.first["lat"] as String) ?? MyNums.newYorkLat,
          double.tryParse(list.first["lon"] as String) ?? MyNums.newYorkLong,
        );

        final uri2 = Uri.parse("${ApiConst.baseUrl}nearbyDriver?"
            "lat=${latLng.latitude}&long=${latLng.longitude}");
        final headers2 = ApiConst.getHeaders();
        final response2 = await http.get(uri2, headers: headers2);
        final parsed2 = await jsonDecode(utf8.decode(response2.bodyBytes));

        if (parsed2["code"] == 0 && parsed2["message"] == "OK") {
          final drivers = (parsed2["data"] as List)
              .map((e) => NearbyDriverModel.fromJson(e));
          return drivers.toList();
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

List<NearbyDriverModel> driversDriversDrivers = [];
