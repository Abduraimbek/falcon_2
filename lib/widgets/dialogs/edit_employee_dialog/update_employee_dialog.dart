///
/// Created by Abduraimbek Yarkinov at 15:48 on 07.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'build_fields/build_fields.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/singletons/singletons.dart';

Future<bool?> showEditEmployeeDialog({
  required BuildContext context,
  required EmployeeModel employeeModel,
}) async {
  employeeModelEmployeeModel = employeeModel;

  final result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _UpdateEmployeeDialog(),
    ),
  );

  return result;
}

class _UpdateEmployeeDialog extends ConsumerWidget {
  const _UpdateEmployeeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(editEmployeeDialogProvider);

    return Container(
      width: 50.vertical,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Top(),
          BuildFields(employeeModel: employeeModelEmployeeModel!),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 50,
                top: 20,
                bottom: 20,
              ),
              child: MyButton(
                text: "Edit",
                onTap: () {
                  if (provider) {
                    ref
                        .read(editEmployeeDialogProvider.notifier)
                        .pressEditEmployeeButton(context: context);
                  }
                },
                color: provider
                    ? MyColors.backgroundColor
                    : MyColors.backgroundColor.withOpacity(.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
