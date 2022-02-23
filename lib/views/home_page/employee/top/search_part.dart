///
/// Created by Abduraimbek Yarkinov at 11:48 on 27.11.2021.
///

import 'package:falcon_2/singletons/api/api.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/dialogs.dart';

class SearchPart extends ConsumerWidget {
  const SearchPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        MyButtonWithSvg(
          text: "Sync employees",
          onTap: () {
            EmployeeSingleton.getEmployees();
          },
          color: MyColors.redColor,
          svgPath: "assets/svg4/sync.svg",
        ),
        const SizedBox(width: 20),
        MyButtonWithSvg(
          text: "Create employee",
          onTap: () async {
            final result = await showCreateEmployeeDialog(context: context);
            if (result == true) {
              EmployeeSingleton.getEmployees();
            }
          },
          color: MyColors.redColor,
          svgPath: "assets/svg2/plus.svg",
        ),
        const SizedBox(width: 40),
      ],
    );
  }
}
