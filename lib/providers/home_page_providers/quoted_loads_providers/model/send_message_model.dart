///
/// Created by Abduraimbek Yarkinov at 20:20 on 11.01.2022.
///

import 'dart:typed_data';

import 'package:enough_mail/enough_mail.dart';
import 'package:html/parser.dart';
import 'package:collection/collection.dart';

class SendMessageModel {
  final String createdData;
  final String subject;
  final bool isSend;
  final bool sending;

  int contentType = 1;
  String text;
  Uint8List? uint8list;
  String? image;

  SendMessageModel({
    required this.createdData,
    required this.subject,
    required this.isSend,
    this.sending = false,
    required this.text,
    this.image,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    final sendMessageModel = SendMessageModel(
      createdData: json["created_at"],
      subject: json["subject"],
      text: json["message"],
      isSend: true,
      image: json["image"],
    );
    if (sendMessageModel.image != null && sendMessageModel.image != "") {
      sendMessageModel.contentType = 2;
    }

    return sendMessageModel;
  }

  static SendMessageModel fromMimeMessage(MimeMessage mimeMessage) {
    String subject = mimeMessage.decodeSubject() ?? "";
    String text = "";
    final html = mimeMessage.decodeTextHtmlPart() ?? "";
    final divs = parse(html).querySelectorAll("div");
    final element = divs.firstWhereOrNull(
        (element) => element.outerHtml.contains('dir="auto"'));
    if (element != null) {
      text = element.firstChild?.text ?? "";
      if (element.children.isNotEmpty) {
        for (var e in element.children) {
          text += "\n" + e.text;
        }
      }
    }

    final sendMessageModel = SendMessageModel(
      subject: subject,
      isSend: false,
      createdData: _getDateString(mimeMessage.decodeDate()),
      text: text,
    );

    final parts = mimeMessage.allPartsFlat;
    int imageIndex = parts
        .indexWhere((element) => element.mediaType.toString() == "image/jpeg");

    if (imageIndex >= 0) {
      sendMessageModel.uint8list = parts[imageIndex].decodeContentBinary();
      if (sendMessageModel.uint8list != null) sendMessageModel.contentType = 2;
    }

    return sendMessageModel;
  }

  static String _getDateString(DateTime? date) {
    if (date == null) return "";

    String str = "";
    str += date.year.toString();
    str += "-";
    str += "${date.month}".padLeft(2, "0");
    str += "-";
    str += "${date.day}".padLeft(2, "0");
    str += "T";
    str += "${date.hour}".padLeft(2, "0");
    str += ":";
    str += "${date.minute}".padLeft(2, "0");
    str += ":";
    str += "${date.second}".padLeft(2, "0");
    str += "Z";

    return str;
  }
}
