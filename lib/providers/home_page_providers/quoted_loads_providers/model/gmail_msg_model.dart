// ///
// /// Created by Abduraimbek Yarkinov at 16:18 on 06.01.2022.
// ///
//
// import 'package:enough_mail/enough_mail.dart';
// import 'package:html/parser.dart';
// import 'package:collection/collection.dart';
//
// class GmailMsgModel {
//   String subject;
//   String text;
//
//   GmailMsgModel({
//     required this.subject,
//     required this.text,
//   });
//
//   @override
//   String toString() {
//     return "{subject: $subject, text: $text}";
//   }
//
//   factory GmailMsgModel.fromMimeMessage(MimeMessage mimeMessage) {
//     String subject = mimeMessage.decodeSubject() ?? "";
//     String text = "";
//
//     final html = mimeMessage.decodeTextHtmlPart() ?? "";
//     final divs = parse(html).querySelectorAll("div");
//     final element = divs.firstWhereOrNull(
//         (element) => element.outerHtml.contains('dir="auto"'));
//     if (element != null) {
//       text = element.firstChild?.text ?? "";
//       if (element.children.isNotEmpty) {
//         for (var e in element.children) {
//           text += "\n" + e.text;
//         }
//       }
//     }
//
//     return GmailMsgModel(
//       subject: subject,
//       text: text,
//     );
//   }
// }
