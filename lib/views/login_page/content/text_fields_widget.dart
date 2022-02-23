///
/// Created by Abduraimbek Yarkinov at 13:21 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/providers/providers.dart';

class TextFieldsWidget extends StatefulWidget {
  const TextFieldsWidget({Key? key}) : super(key: key);

  @override
  _TextFieldsWidgetState createState() => _TextFieldsWidgetState();
}

class _TextFieldsWidgetState extends State<TextFieldsWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst();
    final hintStyle = MyTextStyles.interMediumSecond();

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (v) =>
                  ref.read(loginButtonProvider.notifier).typeLogin(v),
              onSubmitted: (v) => passwordFocusNode.requestFocus(),
              autofocus: true,
              controller: emailController,
              focusNode: emailFocusNode,
              style: style,
              decoration: InputDecoration(
                hintText: "Login",
                hintStyle: hintStyle,
              ),
            ),
            TextField(
              onChanged: (v) =>
                  ref.read(loginButtonProvider.notifier).typePassword(v),
              onSubmitted: (v) {
                if (ref.read(loginButtonProvider)) {
                  ref
                      .read(loginButtonProvider.notifier)
                      .pressLoginButton(context);
                }
              },
              controller: passwordController,
              focusNode: passwordFocusNode,
              style: style,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: hintStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
