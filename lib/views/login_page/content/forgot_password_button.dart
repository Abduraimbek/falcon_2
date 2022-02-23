///
/// Created by Abduraimbek Yarkinov at 17:21 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Forgot password?",
        style: MyTextStyles.interMediumSecond().copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
