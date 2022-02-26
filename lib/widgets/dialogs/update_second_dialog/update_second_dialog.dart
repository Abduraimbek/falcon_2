import 'package:falcon_2/singletons/singletons.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';

Future<void> showUpdateSecondDialog({
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      title: Text("Posted Loads Update Period"),
      content: _UpdateSecondDialogContent(),
    ),
  );
}

class _UpdateSecondDialogContent extends StatefulWidget {
  const _UpdateSecondDialogContent({Key? key}) : super(key: key);

  @override
  _UpdateSecondDialogContentState createState() =>
      _UpdateSecondDialogContentState();
}

class _UpdateSecondDialogContentState
    extends State<_UpdateSecondDialogContent> {
  final list = [4, 5, 7, 10, 15, 30];
  int currentSecond = MyPrefsFields.updateSecond;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.horizontal,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...list
                .map((e) => ListTile(
                      onTap: () {
                        setState(() {
                          currentSecond = e;
                        });
                      },
                      title: Text("Every $e seconds"),
                      trailing: Radio<int>(
                        value: e,
                        groupValue: currentSecond,
                        onChanged: (value) {
                          setState(() {
                            currentSecond = e;
                          });
                        },
                      ),
                    ))
                .toList(),
            const SizedBox(height: 10),
            Center(
              child: MyButton(
                color: MyColors.backgroundColor,
                text: "Save",
                onTap: () async {
                  Navigator.pop(context);
                  await MyPrefs().setUpdateSecond(currentSecond);
                  UpdateOrders4().startTimer();
                },
              ),
            ),
          ]),
    );
  }
}
