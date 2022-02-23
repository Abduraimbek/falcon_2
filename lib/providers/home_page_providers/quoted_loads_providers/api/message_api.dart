///
/// Created by Abduraimbek Yarkinov at 18:56 on 11.01.2022.
///
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:http/http.dart' as http;

class MessageApi {
  static Future<List<SendMessageModel>> sentMessages({
    required String subject,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}messages?subject=$subject");
      final headers = ApiConst.getHeaders();

      final response = await http.get(uri, headers: headers);
      final parsed = jsonDecode(utf8.decode(response.bodyBytes));
      final pList = parsed["data"] as List;
      return pList.map((e) => SendMessageModel.fromJson(e)).toList();
    } catch (e) {
      log("message_api.dart --> sentMessages --> error --> $e");
      return [];
    }
  }

  static Future<bool> sendMessage({
    required int quoteId,
    required String message,
    String? image,
  }) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}sendMessage");
      final headers = ApiConst.postHeadersWithToken();
      final body = <String, dynamic>{
        "quote": quoteId,
        "message": message,
      };
      if (image != null) body.addAll({"image": image});

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        return true;
      } else {
        log("message_api.dart --> sendMessage --> response --> ${response.body}");
        return false;
      }
    } catch (e) {
      log("message_api.dart --> sendMessage --> error --> $e");
      return false;
    }
  }

  static Future<String?> uploadImage(String filePath) async {
    try {
      final uri = Uri.parse("${ApiConst.baseUrl}image");
      final headers = ApiConst.postHeadersWithToken();

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          filePath,
          filename: DateTime.now().toString(),
        ),
      });

      final response = await Dio().postUri(
        uri,
        data: formData,
        options: Options(headers: headers),
      );

      return response.data["data"]["path"];
    } catch (e) {
      log("image upload error --> $e");
    }
  }

  static String getImageUrl(String path) {
    return "http://89.223.71.112:9292/getImage?path=$path";
  }
}
