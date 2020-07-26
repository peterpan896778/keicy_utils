import 'package:date_format/date_format.dart';
import 'package:date_time_format/date_time_format.dart';

class KeicyDateTime {
  // static List<String> initFormat = [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss];
  static List<String> initFormat = [yyyy, '-', mm, '-', dd, ' '];

  static DateTime convertDateStringToDateTime(String strDate, {datePattern = '-', timePattern = ":"}) {
    if (strDate == "" || strDate == null) return null;

    List<String> listDateTime = strDate.split(" ");
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
  }

  static int convertDateStringToMilliseconds(String dateString, {datePattern = '-', timePattern = ":"}) {
    if (dateString == null || dateString == "") return null;
    return convertDateStringToDateTime(dateString, datePattern: datePattern, timePattern: timePattern).millisecondsSinceEpoch;
  }

  static DateTime convertMillisecondsToDateTime(int ms) {
    if (ms == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(ms);
  }

  static String convertMillisecondsToDateString(int ms, {List<String> formats}) {
    if (ms == null) return null;
    if (formats == null || formats.length == 0) formats = initFormat;
    DateTime dateTime = convertMillisecondsToDateTime(ms);
    return convertDateTimeToDateString(dateTime, formats: formats);
  }

  static String convertDateTimeToDateString(DateTime dt, {List<String> formats}) {
    if (dt == null) return null;
    if (formats == null || formats.length == 0) formats = initFormat;
    return formatDate(dt, formats);
  }

  static int convertDateTimeToMilliseconds(DateTime dt) {
    return dt.millisecondsSinceEpoch;
  }

  static List<DateTime> getDateTimesForWeek({DateTime dt}) {
    if (dt == null) dt = DateTime.now();
    switch (dt.weekday) {
      case 1:
        return [dt, dt.add(Duration(days: 6))];
        break;
      case 2:
        return [dt.subtract(Duration(days: 1)), dt.add(Duration(days: 5))];
        break;
      case 3:
        return [dt.subtract(Duration(days: 2)), dt.add(Duration(days: 4))];
        break;
      case 4:
        return [dt.subtract(Duration(days: 3)), dt.add(Duration(days: 3))];
        break;
      case 5:
        return [dt.subtract(Duration(days: 4)), dt.add(Duration(days: 2))];
        break;
      case 6:
        return [dt.subtract(Duration(days: 5)), dt.add(Duration(days: 1))];
        break;
      case 7:
        return [dt.subtract(Duration(days: 6)), dt];
        break;
      default:
    }

    return [dt, dt];
  }

  static List<DateTime> getDateTimesForMonth({DateTime dt}) {
    if (dt == null) dt = DateTime.now();

    return [
      DateTime(dt.year, dt.month, 1),
      DateTime(dt.year, dt.month + 1, 1).subtract(Duration(days: 1)),
    ];
  }
}
