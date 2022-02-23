///
/// Created by Abduraimbek Yarkinov at 4:08 PM on 11/26/2021.
///

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

class MyStringHelper {
  static String getMinutesAgo(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return "";

    try {
      DateTime dateTime = DateFormat("M/d/yyyy hh:mm").parse(timeStr);
      String hourMinuteAM = DateFormat("h:mma").format(dateTime) + " (";
      DateTime currentTime = DateTime.now();
      var difference = currentTime.difference(dateTime).inMinutes;

      var hourGap = difference ~/ 60;
      var minuteGap = difference - hourGap * 60;

      if (hourGap == 1) {
        hourMinuteAM += "$hourGap hour ";
      } else if (hourGap > 1) {
        hourMinuteAM += "$hourGap hours ";
      }

      if (minuteGap == 1) {
        hourMinuteAM += "$minuteGap minute ";
      } else if (minuteGap > 1) {
        hourMinuteAM += "$minuteGap minutes ";
      }

      hourMinuteAM += "ago)";

      return hourMinuteAM;
    } catch (_) {
      return "";
    }
  }

  static String timeFromMillisecondsSinceEpoch(int time) {
    final date = DateTime.fromMicrosecondsSinceEpoch(time);
    String str = addNolToAlone(date.month);
    str += "/";
    str += addNolToAlone(date.day);
    str += " ";
    str += addNolToAlone(date.hour);
    str += ":";
    str += addNolToAlone(date.minute);
    str += ":";
    str += addNolToAlone(date.second);
    return str;
  }

  static String moneyFormat(num number) {
    final oCcy = NumberFormat("#,###", "en_US");
    return oCcy.format(number);
  }

  static String minusWhenNull(dynamic str) {
    if (str == null) {
      return "-";
    } else if ("$str" == "") {
      return "-";
    } else {
      return "$str";
    }
  }

  static String timeStringFromDateAndTime(DateTime date, TimeOfDay time) {
    String str = "${date.year}";
    str += "-${addNolToAlone(date.month)}-";
    str += "${addNolToAlone(date.day)}T";
    str += "${addNolToAlone(time.hour)}:";
    str += "${addNolToAlone(time.minute)}:";
    str += "${addNolToAlone(date.second)}+05:00";

    return str;
  }

  static String addNolToAlone(int i) => "$i".length == 1 ? "0$i" : "$i";

  // static String googleMapsUrl(int x, int y, int z) =>
  //     "https://maps.googleapis.com/maps/api/staticmap?"
  //     "size=400x400&key=AIzaSyBZiaoR6LhBci4bSDYJynj54hVLYZgm6pA"
  //     "&x=$x&y=$y&zoom=$z";

  static String googleMapsUrl(int x, int y, int z) =>
      "https://www.google.com/maps/vt/pb=!1m4!1m3"
      "!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5"
      "e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23"
      "i4111425";
}
