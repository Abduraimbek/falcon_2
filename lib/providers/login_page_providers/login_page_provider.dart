///
/// Created by Abduraimbek Yarkinov at 17:54 on 16.11.2021.
///

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:falcon_2/views/views.dart';
import 'package:flutter/material.dart';

final loginButtonProvider =
    StateNotifierProvider.autoDispose<LoginButtonNotifier, bool>((ref) {
  return LoginButtonNotifier();
});

class LoginButtonNotifier extends StateNotifier<bool> {
  LoginButtonNotifier() : super(false);

  String login = "";
  String password = "";

  void _checkState() {
    state = login != "" && password != "";
  }

  void typeLogin(String value) {
    login = value;
    _checkState();
  }

  void typePassword(String value) {
    password = value;
    _checkState();
  }

  Future<void> pressLoginButton(BuildContext context) async {
    state = false;

    showWaitingDialog(context);

    final internet = await InternetConnectionChecker().hasConnection;

    if (internet) {
      final result = await LoginApi.signIn(login: login, password: password);
      if (result == true) {
        await MyPrefs().setIsAuthenticated(true);
        EmployeeSingleton.getEmployees();
        Navigator.of(context).pop();
        Navigator.of(context)
            .pushReplacement(MyCustomRoutes.myAnimatedRoute(const HomePage()));
      } else {
        Navigator.of(context).pop();
        await showMessageDialog(
            context: context, message: "Login or password incorrect!");
        state = true;
      }
    } else {
      Navigator.of(context).pop();
      await showMessageDialog(
          context: context, message: "No internet connection!");
      state = true;
    }
  }
}
