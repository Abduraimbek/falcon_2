///
/// Created by Abduraimbek Yarkinov at 11:58 on 13.12.2021.
///

import 'package:flutter/material.dart';
import 'top/top.dart';
import 'package:falcon_2/utils/utils.dart';
import 'employee_list/employee_list.dart';
import 'top/search_part.dart';

class Employee extends StatelessWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Top(),
        Container(
          width: double.infinity,
          height: 1,
          color: MyColors.thirdTextColor,
        ),
        const SizedBox(height: 15),
        const SearchPart(),
        const SizedBox(height: 15),
        const Expanded(child: EmployeeList()),
      ],
    );
  }
}
