///
/// Created by Abduraimbek Yarkinov at 17:56 on 24.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'top/top.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:falcon_2/widgets/widgets.dart';

Future<void> showDriverNotesDialog({
  required BuildContext context,
  required DriverModel driverModel,
}) async {
  final result = await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: _DriverNotesDialog(
        driverModel: driverModel,
      ),
    ),
  );

  if (result == true) {
    DriverSingleton.getDrivers();
  }
}

class _DriverNotesDialog extends StatefulWidget {
  const _DriverNotesDialog({
    Key? key,
    required this.driverModel,
  }) : super(key: key);

  final DriverModel driverModel;

  @override
  _DriverNotesDialogState createState() => _DriverNotesDialogState();
}

class _DriverNotesDialogState extends State<_DriverNotesDialog> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.driverModel.notes);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final driverData = "${widget.driverModel.driverId}"
        " ${widget.driverModel.firstName}"
        " ${widget.driverModel.lastName}";

    return Container(
      height: 30.vertical,
      width: 30.horizontal,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Top(driverData: driverData),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: MyColors.backgroundColor,
                  ),
                ),
                child: TextField(
                  autofocus: true,
                  controller: controller,
                  style: MyTextStyles.interMediumFirst(),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: MyButton(
              text: "Ok",
              onTap: () {
                _method(context);
              },
              color: MyColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _method(BuildContext context) async {
    showWaitingDialog(context);

    final driverModel = widget.driverModel;
    driverModel.notes = controller.text;
    final result = await DriverApi.updateDriver(driverModel: driverModel);

    Navigator.pop(context);

    if (result) {
      Navigator.pop(context, true);
    }
  }
}
