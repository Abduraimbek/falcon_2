///
/// Created by Abduraimbek Yarkinov at 15:48 on 07.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'top/top.dart';
import 'build_fields/build_fields.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:falcon_2/providers/providers.dart';

Future<bool?> showCreateEmployeeDialog({
  required BuildContext context,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) => const AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _CreateEmployeeDialog(),
    ),
  );

  return result;
}

class _CreateEmployeeDialog extends ConsumerWidget {
  const _CreateEmployeeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(createEmployeeDialogProvider);

    return Container(
      width: 50.vertical,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Top(),
          const BuildFields(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 50,
                top: 20,
                bottom: 20,
              ),
              child: MyButton(
                text: "Create",
                onTap: () {
                  if (provider) {
                    ref
                        .read(createEmployeeDialogProvider.notifier)
                        .pressCreateEmployeeButton(context: context);
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
