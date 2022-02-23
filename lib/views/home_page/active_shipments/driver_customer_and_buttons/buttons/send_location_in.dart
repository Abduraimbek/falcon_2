///
/// Created by Abduraimbek Yarkinov at 16:21 on 06.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendLocationIn extends StatefulWidget {
  const SendLocationIn({Key? key}) : super(key: key);

  @override
  State<SendLocationIn> createState() => _SendLocationInState();
}

class _SendLocationInState extends State<SendLocationIn> {
  final List<String> stringList = [
    "10 minutes",
    "20 minutes",
    "30 minutes",
    "1 hour",
  ];

  bool switchValue = true;
  String selectedString = "10 minutes";

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst(
      fontSize: 3.7,
      color: MyColors.redColor,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Send location in",
          style: style.copyWith(
            color: const Color(0xff8c91a5),
          ),
        ),
        Switch(
          activeColor: MyColors.cardColor,
          activeTrackColor: MyColors.greenColor,
          value: switchValue,
          onChanged: (v) {
            setState(() {
              switchValue = v;
            });
          },
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              width: 1,
              color: MyColors.redColor,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedString,
              isDense: true,
              borderRadius: BorderRadius.circular(4),
              style: style,
              icon: SvgPicture.asset(
                "assets/svg1/down.svg",
                color: MyColors.redColor,
              ),
              onChanged: (value) {
                if (value != null) {
                  selectedString = value;
                  setState(() {});
                }
              },
              items: stringList
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e, style: style),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
