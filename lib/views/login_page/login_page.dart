import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'content/content.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Center(
        child: Content(),
      ),
    );
  }
}
