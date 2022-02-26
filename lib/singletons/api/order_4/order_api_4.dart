import 'dart:convert';
import 'dart:developer';

import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:http/http.dart' as http;

class OrderApi4 {
  Future<List<OrderModel4>?> getOrders() async {
    try {
      final uri = Uri.parse(
          "http://188.225.78.146:3000/latest?from=${MyPrefsFields.lastUpdateTime}&limit=100");
      final response = await http.get(uri);
      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));
      final List list = parsed["items"];
      return list.map((e) => OrderModel4.fromJson(e)).toList();
    } catch (e) {
      log("order_api_4.dart --> getOrders --> error --> $e");
      return null;
    }
  }

  Future<OrderByLinkModel3?> orderByLink(String orderLink) async {
    try {
      final uri = Uri.parse("https://www9.sylectus.com/$orderLink");
      final response = await http.post(uri);
      log(response.body);
      return OrderByLinkModel3.fromHtml(response.body);
    } catch (e) {
      log("order_api.4 --> orderByLink --> error --> $e");
      return null;
    }
  }

// static Map<String, String> get _headersFalcon {
//   return {
//     "Accept": "text/html,application/xhtml+xml,application/xml;"
//         "q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application"
//         "/signed-exchange;v=b3;q=0.9",
//     "Accept-Encoding": "gzip, deflate, br",
//     "Accept-Language": "en-US,en;q=0.9,ru-RU;q=0.8,ru;q=0.7",
//     "Content-Type": "application/x-www-form-urlencoded",
//     // "Cookie": MyPrefsFields.cookieFalcon,
//     "Host": "www9.sylectus.com",
//     "Origin": "https://www9.sylectus.com",
//   };
// }
}
