///
/// Created by Abduraimbek Yarkinov at 11:16 on 16.11.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'content/content.dart';
import 'package:falcon_2/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: MyBitsDojoWindow(
        child: const Center(
          child: Content(),
        ),
      ),
    );
  }
}
