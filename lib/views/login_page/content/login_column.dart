///
/// Created by Abduraimbek Yarkinov at 12:36 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'logo_widget.dart';
import 'package:falcon_2/utils/utils.dart';
import 'log_in_text_widget.dart';
import 'text_fields_widget.dart';
import 'login_button.dart';
import 'forgot_password_button.dart';

class LoginColumn extends StatelessWidget {
  const LoginColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.62.vertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 4.5.vertical),
          const LogoWidget(),
          SizedBox(height: 2.8.vertical),
          const LogInTextWidget(),
          SizedBox(height: 3.vertical),
          const TextFieldsWidget(),
          const Spacer(),
          const LoginButton(),
          const Spacer(),
          const ForgotPasswordButton(),
          const Spacer(),
        ],
      ),
    );
  }
}
