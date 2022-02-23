///
/// Created by Abduraimbek Yarkinov at 18:03 on 07.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';
import 'build_check_email_item.dart';
import 'build_switch.dart';

class BuildFields extends ConsumerStatefulWidget {
  const BuildFields({
    Key? key,
    required this.employeeModel,
  }) : super(key: key);

  final EmployeeModel employeeModel;

  @override
  ConsumerState createState() => _BuildFieldsState();
}

class _BuildFieldsState extends ConsumerState<BuildFields> {
  final fullNameFocusNode = FocusNode();
  final mailFocusNode = FocusNode();
  final loginFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  late bool isRoot;
  late bool isAccessDriver;
  late bool isAccessEmployee;

  @override
  void initState() {
    super.initState();
    isRoot = ref.read(editEmployeeDialogProvider.notifier).isRoot;
    isAccessDriver =
        ref.read(editEmployeeDialogProvider.notifier).isAccessDriver;
    isAccessEmployee =
        ref.read(editEmployeeDialogProvider.notifier).isAccessEmployee;
  }

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
    final provider = ref.read(editEmployeeDialogProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          MyTextFieldForUpdateEmployeeFocusNode(
            text: widget.employeeModel.fullName,
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
          MyTextFieldForUpdateEmployeeFocusNode(
            text: widget.employeeModel.mail,
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
          MyTextFieldForUpdateEmployeeFocusNode(
            text: widget.employeeModel.login,
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
          MyTextFieldForUpdateEmployeeFocusNode(
            text: widget.employeeModel.password,
            label: "Password",
            onChanged: (value) {
              provider.typePassword(value);
            },
            onSubmitted: (value) {},
            focusNode: passwordFocusNode,
          ),
          const SizedBox(height: 10),
          BuildCheckEmailItem(
            isFalcon: true,
            value: widget.employeeModel.fMail,
          ),
          const SizedBox(height: 10),
          BuildCheckEmailItem(
            isFalcon: false,
            value: widget.employeeModel.aMail,
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
