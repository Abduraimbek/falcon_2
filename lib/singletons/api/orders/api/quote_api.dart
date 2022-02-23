///
/// Created by Abduraimbek Yarkinov at 17:51 on 08.12.2021.
///

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:falcon_2/singletons/singletons.dart';
import 'dart:developer';

class QuoteApi {
  // static Future<bool> quote2({
  //   required QuoteModel2 quoteModel2,
  // }) async {
  //   final dio = Dio();
  //   final headers = ApiConst.postHeadersWithToken();
  //   final uri = Uri.parse("${ApiConst.baseUrl}quote");
  //   final body = jsonEncode(quoteModel2.toJson());
  //
  //   print(uri.toString());
  //   print(headers);
  //   print(body);
  //
  //   final response = await dio.postUri(
  //     uri,
  //     options: Options(headers: headers),
  //     data: body,
  //   );
  //
  //   print(response.data);
  //
  //   return false;
  // }

  static Future<bool> quote({
    required QuoteModel2 quoteModel2,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}quote");
      final headers = await ApiConst.postHeadersWithTokenThread();
      final body = jsonEncode(quoteModel2.toJson());

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));
      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        return true;
      } else {
        log("quote_api.dart => quote => response => ${response.body}");
        return false;
      }
    } catch (e) {
      log("quote_api.dart => quote => error => $e");
      return false;
    }
  }
}
