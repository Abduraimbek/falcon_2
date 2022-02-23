///
/// Created by Abduraimbek Yarkinov at 21:16 on 21.12.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:http/http.dart' as http;

class OrderApi3 {
  static Map<String, String> _headersFalcon() {
    return {
      "Accept": "text/html,application/xhtml+xml,application/xml;"
          "q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application"
          "/signed-exchange;v=b3;q=0.9",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept-Language": "en-US,en;q=0.9,ru-RU;q=0.8,ru;q=0.7",
      "Content-Type": "application/x-www-form-urlencoded",
      "Cookie": MyPrefsFields.cookieFalcon,
      "Host": "www9.sylectus.com",
      "Origin": "https://www9.sylectus.com",
    };
  }

  static Map<String, String> _headersAzam() {
    return {
      "Accept": "text/html,application/xhtml+xml,application"
          "/xml;q=0.9,image/avif,image/webp,image"
          "/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept-Language": "en-US,en;q=0.9,ru-RU;q=0.8,ru;q=0.7",
      "Content-Type": "application/x-www-form-urlencoded",
      "Cookie": MyPrefsFields.cookieAzam,
      "Host": "www10.sylectus.com",
      "Origin": "https://www10.sylectus.com",
    };
  }

  static Future<String?> ordersFromSiteFalcon() async {
    final headers = _headersFalcon();

    try {
      final uri =
          Uri.parse("https://www9.sylectus.com/II14_managepostedloads.asp");

      final response = await http.post(uri, headers: headers);

      return response.body;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> ordersFromSiteAzam() async {
    final headers = _headersAzam();

    try {
      final uri =
          Uri.parse("https://www10.sylectus.com/II14_managepostedloads.asp");

      final response = await http.get(uri, headers: headers);

      return response.body;
    } catch (e) {
      return null;
    }
  }

  static Future<OrderByLinkModel3?> orderByLink(
    OrderModel3 orderModel3,
  ) async {
    if (orderModel3.owner == 9) {
      final headers = _headersFalcon();

      try {
        final uri =
            Uri.parse("https://www9.sylectus.com/${orderModel3.orderLink}");

        final response = await http.post(uri, headers: headers);

        return OrderByLinkModel3.fromHtml(response.body);
      } catch (e) {
        return null;
      }
    } else if (orderModel3.owner == 10) {
      final headers = _headersAzam();

      try {
        final uri =
            Uri.parse("https://www10.sylectus.com/${orderModel3.orderLink}");

        final response = await http.post(uri, headers: headers);

        return OrderByLinkModel3.fromHtml(response.body);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
