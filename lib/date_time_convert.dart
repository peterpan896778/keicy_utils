// import 'package:date_format/date_format.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class KeicyDateTime {
  static const String initFormat = "Y-m-d";

  static DateTime convertDateStringToDateTime({@required String dateString, datePattern = '-', timePattern = ":"}) {
    try {
      if (dateString == "" || dateString == null) return null;

      List<String> listDateTime = dateString.split(" ");
      List<String> listDate = listDateTime[0].split(datePattern);
      List<String> listTime = (listDateTime.length == 2) ? listDateTime[1].split(timePattern) : null;

      return DateTime(
        int.parse((listDate != null && listDate.length >= 1 && listDate[0] != "") ? listDate[0].toString() : "0"),
        int.parse((listDate != null && listDate.length >= 2 && listDate[1] != "") ? listDate[1].toString() : "0"),
        int.parse((listDate != null && listDate.length >= 3 && listDate[2] != "") ? listDate[2].toString() : "0"),
        int.parse((listTime != null && listTime.length >= 1 && listTime[0] != "") ? listTime[0].toString() : "0"),
        int.parse((listTime != null && listTime.length >= 2 && listTime[1] != "") ? listTime[1].toString() : "0"),
        int.parse((listTime != null && listTime.length >= 3 && listTime[2] != "") ? listTime[2].toString() : "0"),
      );
    } catch (e) {
      return null;
    }
  }

  static int convertDateStringToMilliseconds({@required String dateString, datePattern = '-', timePattern = ":"}) {
    try {
      if (dateString == null || dateString == "") return null;
      return convertDateStringToDateTime(
        dateString: dateString,
        datePattern: datePattern,
        timePattern: timePattern,
      ).millisecondsSinceEpoch;
    } catch (e) {
      return null;
    }
  }

  static String convertDateTimeToDateString({@required DateTime dateTime, String formats = initFormat}) {
    try {
      if (dateTime == null) return "";
      return DateTimeFormat.format(dateTime, format: formats);
    } catch (e) {
      return "";
    }
  }

  static String convertMillisecondsToDateString({@required int ms, String formats = initFormat}) {
    try {
      if (ms == null) return "";
      return convertDateTimeToDateString(dateTime: DateTime.fromMillisecondsSinceEpoch(ms), formats: formats);
    } catch (e) {
      return "";
    }
  }

  static List<DateTime> getDateTimesForWeek({DateTime dateTime}) {
    if (dateTime == null) dateTime = DateTime.now();
    switch (dateTime.weekday) {
      case 1:
        return [dateTime, dateTime.add(Duration(days: 6))];
        break;
      case 2:
        return [dateTime.subtract(Duration(days: 1)), dateTime.add(Duration(days: 5))];
        break;
      case 3:
        return [dateTime.subtract(Duration(days: 2)), dateTime.add(Duration(days: 4))];
        break;
      case 4:
        return [dateTime.subtract(Duration(days: 3)), dateTime.add(Duration(days: 3))];
        break;
      case 5:
        return [dateTime.subtract(Duration(days: 4)), dateTime.add(Duration(days: 2))];
        break;
      case 6:
        return [dateTime.subtract(Duration(days: 5)), dateTime.add(Duration(days: 1))];
        break;
      case 7:
        return [dateTime.subtract(Duration(days: 6)), dateTime];
        break;
      default:
    }

    return [dateTime, dateTime];
  }

  static List<DateTime> getDateTimesForMonth({DateTime dateTime}) {
    if (dateTime == null) dateTime = DateTime.now();

    return [
      DateTime(dateTime.year, dateTime.month, 1),
      DateTime(dateTime.year, dateTime.month + 1, 1).subtract(Duration(days: 1)),
    ];
  }
}
