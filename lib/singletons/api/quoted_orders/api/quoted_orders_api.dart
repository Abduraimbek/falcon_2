///
/// Created by Abduraimbek Yarkinov at 19:09 on 13.12.2021.
///

import 'dart:convert';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class QuotedOrdersApi {
  static Future<List<QuotedOrderModel>?> quotedOrders() async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}quotedOrders");
      final headers = await ApiConst.getHeadersThread();
      final response = await http.get(uri, headers: headers);

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      final list = (parsed["data"] as List)
          .map((e) => QuotedOrderModel.fromJson(e))
          .toList();
      return list;
    } catch (e) {
      log("quoted_orders_api.dart --> quotedOrders --> error --> $e");
    }
  }

  static Future<QuoteByIdModel?> quoteById({
    required int id,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}quote?id=$id");
      final headers = ApiConst.getHeaders();
      final response = await http.get(uri, headers: headers);

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        final model = QuoteByIdModel.fromJson(parsed["data"]);
        return model;
      } else {
        log("quoted_orders_api.dart --> quoteById --> "
            "response --> ${response.body}");
      }
    } catch (e) {
      log("quoted_orders_api.dart --> quoteById --> error --> $e");
    }
  }
}
