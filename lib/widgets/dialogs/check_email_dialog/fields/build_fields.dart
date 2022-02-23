///
/// Created by Abduraimbek Yarkinov at 17:34 on 14.12.2021.
///

import 'dart:convert';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter/material.dart';
import 'fields_item.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:http/http.dart' as http;

class BuildFields extends StatefulWidget {
  const BuildFields({Key? key}) : super(key: key);

  @override
  State<BuildFields> createState() => _BuildFieldsState();
}

class _BuildFieldsState extends State<BuildFields> {
  String email = "";
  String password = "";
  bool enable = false;

  void _checkButton() {
    if (email.length >= 3 && password.length >= 3) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FieldsItem(
            onChanged: (value) {
              email = value;
              _checkButton();
            },
            autofocus: true,
            hintText: "Email",
          ),
          const SizedBox(height: 10),
          FieldsItem(
            onChanged: (value) {
              password = value;
              _checkButton();
            },
            autofocus: false,
            hintText: "Password",
          ),
          const SizedBox(height: 10),
          MyButton(
            text: "Save",
            onTap: () {
              _pressButton(context);
            },
            color: MyColors.redColor,
          ),
        ],
      ),
    );
  }

  Future<void> _pressButton(
    BuildContext context,
  ) async {
    _mailLogin(
      email,
      password,
      context,
    );
  }

  Future<void> _mailLogin(
    String mail,
    String password,
    BuildContext context,
  ) async {
    try {
      showWaitingDialog(context);

      final uri = Uri.parse("${ApiConst.baseUrl}mailLogin");
      final headers = ApiConst.postHeadersWithToken();
      final body = jsonEncode({
        "mail": mail,
        "password": password,
      });

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      final parsed = await jsonDecode(utf8.decode(response.bodyBytes));

      Navigator.pop(context);

      if (parsed["code"] == 0 && parsed["message"] == "OK") {
        String responseMail = parsed["data"]["mail"];
        String responsePassword = parsed["data"]["password"];
        Navigator.pop(context, [responseMail, responsePassword]);
      } else {
        showMessageDialog(
          context: context,
          message: response.body,
        );
      }
    } catch (e) {
      showMessageDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
