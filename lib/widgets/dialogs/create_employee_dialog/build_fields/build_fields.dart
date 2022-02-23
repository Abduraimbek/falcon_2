///
/// Created by Abduraimbek Yarkinov at 18:03 on 07.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';
import 'build_switch.dart';

class BuildFields extends ConsumerStatefulWidget {
  const BuildFields({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BuildFieldsState();
}

class _BuildFieldsState extends ConsumerState<BuildFields> {
  final fullNameFocusNode = FocusNode();
  final mailFocusNode = FocusNode();
  final loginFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool isRoot = false;
  bool isAccessDriver = false;
  bool isAccessEmployee = false;

  @override
  void dispose() {
    fullNameFocusNode.dispose();
    mailFocusNode.dispose();
    loginFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(createEmployeeDialogProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          MyTextFieldForCreateEmployeeFocusNode(
            label: "Full name",
            onChanged: (value) {
              provider.typeFullName(value);
            },
            onSubmitted: (value) {
              mailFocusNode.requestFocus();
            },
            focusNode: fullNameFocusNode,
            autofocus: true,
          ),
          const SizedBox(height: 10),
          MyTextFieldForCreateEmployeeFocusNode(
            label: "Email",
            onChanged: (value) {
              provider.typeMail(value);
            },
            onSubmitted: (value) {
              loginFocusNode.requestFocus();
            },
            focusNode: mailFocusNode,
          ),
          const SizedBox(height: 10),
          MyTextFieldForCreateEmployeeFocusNode(
            label: "Login",
            onChanged: (value) {
              provider.typeLogin(value);
            },
            onSubmitted: (value) {
              passwordFocusNode.requestFocus();
            },
            focusNode: loginFocusNode,
          ),
          const SizedBox(height: 10),
          MyTextFieldForCreateEmployeeFocusNode(
            label: "Password",
            onChanged: (value) {
              provider.typePassword(value);
            },
            onSubmitted: (value) {},
            focusNode: passwordFocusNode,
          ),
          BuildSwitch(
            onChanged: (value) {
              setState(() {
                isRoot = value;
              });
              provider.changeIsRoot(value);
            },
            value: isRoot,
            text: "Root",
          ),
          BuildSwitch(
            onChanged: (value) {
              setState(() {
                isAccessDriver = value;
              });
              provider.changeIsAccessDriver(value);
            },
            value: isAccessDriver,
            text: "Access Driver",
          ),
          BuildSwitch(
            onChanged: (value) {
              setState(() {
                isAccessEmployee = value;
              });
              provider.changeIsAccessEmployee(value);
            },
            value: isAccessEmployee,
            text: "Access Employee",
          ),
        ],
      ),
    );
  }
}
