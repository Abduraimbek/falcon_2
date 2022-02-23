///
/// Created by Abduraimbek Yarkinov at 20:16 on 08.12.2021.
///

import 'package:flutter/material.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:falcon_2/utils/utils.dart';

class TimeToPickUp extends ConsumerStatefulWidget {
  const TimeToPickUp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _TimeToPickUpState();
}

class _TimeToPickUpState extends ConsumerState<TimeToPickUp> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String dateString = "";
  String timeString = "";

  String _getDate(DateTime date) {
    String str = "";
    str += "${date.year}";
    str += "/";
    str += "${date.month}".length != 1 ? "${date.month}" : "0${date.month}";
    str += "/";
    str += "${date.day}".length != 1 ? "${date.day}" : "0${date.day}";
    return str;
  }

  String _getTime(TimeOfDay time) {
    String str = "";
    str += "${time.hour}".length != 1 ? "${time.hour}" : "0${time.hour}";
    str += ":";
    str += "${time.minute}".length != 1 ? "${time.minute}" : "0${time.minute}";
    return str;
  }

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.interMediumFirst(fontSize: 3.3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "ETA to Pick-up:  ",
          style: style,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: MyColors.secondTextColor,
            ),
          ),
          child: TextButton(
            onPressed: () async {
              final a = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(2050),
              );

              if (a != null) {
                setState(() {
                  selectedDate = a;
                  dateString = _getDate(a);
                });

                ref.read(quoteDetailsProvider).typeTimeToPickUp(
                      MyStringHelper.timeStringFromDateAndTime(
                        selectedDate,
                        selectedTime,
                      ),
                    );
              }
            },
            child: Text(
              dateString,
              style: style,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: MyColors.secondTextColor,
            ),
          ),
          child: TextButton(
            onPressed: () async {
              final a = await showTimePicker(
                context: context,
                initialTime: selectedTime,
              );

              if (a != null) {
                setState(() {
                  selectedTime = a;
                  timeString = _getTime(a);
                });

                ref.read(quoteDetailsProvider).typeTimeToPickUp(
                      MyStringHelper.timeStringFromDateAndTime(
                        selectedDate,
                        selectedTime,
                      ),
                    );
              }
            },
            child: Text(
              timeString,
              style: style,
            ),
          ),
        ),
        const SizedBox(width: 2),
        InkWell(
          onTap: () {
            ref.read(quoteDetailsProvider).clearTimeToPickUp();
            setState(() {
              timeString = "";
              dateString = "";
            });
          },
          child: const Icon(
            Icons.close,
            color: MyColors.backgroundColor,
          ),
        ),
      ],
    );
  }
}
