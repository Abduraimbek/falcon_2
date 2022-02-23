///
/// Created by Abduraimbek Yarkinov at 18:02 on 14.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:falcon_2/widgets/dialogs.dart';
import 'package:falcon_2/providers/providers.dart';

class BuildCheckEmailItem extends ConsumerStatefulWidget {
  const BuildCheckEmailItem({
    Key? key,
    required this.isFalcon,
    required this.value,
  }) : super(key: key);

  final bool isFalcon;
  final String value;

  @override
  ConsumerState createState() => _BuildCheckEmailItemState();
}

class _BuildCheckEmailItemState extends ConsumerState<BuildCheckEmailItem> {
  String value = "...";

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.isFalcon ? "Falcon:" : "Azam:", style: style),
        const SizedBox(width: 35),
        Container(
          height: 2.5.vertical,
          width: 30.vertical,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: const Color(0xffbababa),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(value, style: style),
              ),
              MyButtonView(
                onTap: () async {
                  final result = await showCheckEmailDialog(
                    context: context,
                    isFalcon: widget.isFalcon,
                  );

                  if (result != null) {
                    setState(() {
                      value = result[0];
                    });
                    if (widget.isFalcon) {
                      ref
                          .read(editEmployeeDialogProvider.notifier)
                          .setF(result);
                    } else {
                      ref
                          .read(editEmployeeDialogProvider.notifier)
                          .setA(result);
                    }
                  }
                },
                child: SvgPicture.asset(
                  "assets/svg2/pencil.svg",
                  color: MyColors.backgroundColor,
                  width: 1.8.vertical,
                  height: 1.8.vertical,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
