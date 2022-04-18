import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'top/top.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/widgets/dialogs.dart';

Future<void> showCookieChangeDialog({
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _CookieChangeDialog(
        cookieAzam: MyPrefsFields.cookieAzam,
        cookieFalcon: MyPrefsFields.cookieFalcon,
      ),
    ),
  );
}

class _CookieChangeDialog extends StatefulWidget {
  const _CookieChangeDialog({
    Key? key,
    required this.cookieFalcon,
    required this.cookieAzam,
  }) : super(key: key);

  final String cookieFalcon;
  final String cookieAzam;

  @override
  _CookieChangeDialogState createState() => _CookieChangeDialogState();
}

class _CookieChangeDialogState extends State<_CookieChangeDialog> {
  late TextEditingController controllerFalcon;
  late TextEditingController controllerAzam;
  String falconCookie = "";
  String azamCookie = "";

  @override
  void initState() {
    super.initState();
    controllerFalcon = TextEditingController(text: widget.cookieFalcon);
    controllerAzam = TextEditingController(text: widget.cookieAzam);
  }

  @override
  void dispose() {
    controllerFalcon.dispose();
    controllerAzam.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.vertical,
      width: 30.horizontal,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Top(
            onPressed: () {},
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: MyColors.backgroundColor,
                  ),
                ),
                child: TextField(
                  onChanged: (value) {
                    falconCookie = value;
                  },
                  autofocus: true,
                  controller: controllerFalcon,
                  style: MyTextStyles.interMediumFirst(),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: "Falcon Cookie",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: MyColors.backgroundColor,
                  ),
                ),
                child: TextField(
                  onChanged: (value) {
                    azamCookie = value;
                  },
                  autofocus: false,
                  controller: controllerAzam,
                  style: MyTextStyles.interMediumFirst(),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: "Azam Cookie",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: MyButton(
              text: "Ok",
              onTap: () {
                _method(context);
              },
              color: MyColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _method(BuildContext context) async {
    if (MyPrefsFields.isRoot) {
      showWaitingDialog(context);

      final resultFalcon = await _setCookieApi(
        "falcon",
        falconCookie,
      );
      final resultAzam = await _setCookieApi(
        "azam",
        azamCookie,
      );

      Navigator.pop(context);
      if (resultAzam || resultFalcon) Navigator.pop(context);
    }
  }

  Future<bool> _setCookieApi(String to, String cookie) async {
    try {
      final uri = Uri.parse("http://188.225.78.146:3000/set-cookie");
      final body = jsonEncode({"to": to, "cookie": cookie});
      final response = await post(
        uri,
        body: body,
        headers: {"Content-Type": "application/json"},
      );
      final parsed = await jsonDecode(
        utf8.decode(response.bodyBytes),
      );

      return parsed["ok"];
    } catch (e) {
      log("cookie_change_dialog.dart --> _setCookieApi --> error --> $e");
      return false;
    }
  }
}
