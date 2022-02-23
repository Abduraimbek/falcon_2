///
/// Created by Abduraimbek Yarkinov at 12:10 on 13.12.2021.
///

import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/widgets/dialogs/edit_employee_dialog/update_employee_dialog.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:falcon_2/utils/utils.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.style,
    required this.employee,
  }) : super(key: key);

  final TextStyle style;
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              employee.fullName,
              style: style,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              employee.mail,
              style: style,
            ),
          ),
          MyButtonView(
            onTap: () {
              showEditEmployeeDialog(
                context: context,
                employeeModel: employee,
              );
            },
            child: SvgPicture.asset(
              "assets/svg2/pencil.svg",
              width: 2.vertical,
              height: 2.vertical,
              fit: BoxFit.cover,
              color: MyColors.redColor,
            ),
          ),
          MyButtonView(
            onTap: () {
              EmployeeSingleton.deleteEmployee(
                context: context,
                employee: employee,
              );
            },
            child: SvgPicture.asset(
              "assets/svg4/delete.svg",
              width: 2.vertical,
              height: 2.vertical,
              fit: BoxFit.cover,
              color: MyColors.redColor,
            ),
          ),
        ],
      ),
    );
  }
}
