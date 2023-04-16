import 'package:intl/intl.dart';

class Utils {
  static String checkTimeKeeping(String date, String timeIn, String timeOut) {
    final DateTime timeCheckIn1 = handleDate(date, '8:00');
    final DateTime timeCheckIn2 = handleDate(date, '13:00');
    final DateTime timeCurfewIn = handleDate(date, '8:30');
    final DateTime timeCheckOut1 = handleDate(date, '12:00');
    final DateTime timeCheckOut2 = handleDate(date, '17:00');
    final DateTime timeCurfewOut = handleDate(date, '16:30');
    final DateTime timein = handleDate(date, timeIn);
    final DateTime timeout = handleDate(date, timeOut);
    if (timein.compareTo(timeCheckIn1) <= 0) {
      if (timeout.compareTo(timeCurfewOut) >= 0 &&
          timeout.compareTo(timeCheckOut2) < 0) {
        return 'Muộn';
      } else if (timeout.compareTo(timeCurfewOut) < 0 &&
          timeout.compareTo(timeCheckOut1) > 0) {
        return 'Nửa';
      } else if (timeout.compareTo(timeCheckOut2) > 0) {
        return 'Đủ';
      }
      return 'Vắng';
    } else if (timein.compareTo(timeCheckIn1) > 0 &&
        timein.compareTo(timeCurfewIn) <= 0) {
      if (timeout.compareTo(timeCurfewOut) >= 0 &&
          timeout.compareTo(timeCheckOut2) < 0) {
        return 'Nửa';
      } else if (timeout.compareTo(timeCheckOut2) > 0) {
        return 'Muộn';
      }
      return 'Vắng';
    } else if (timein.compareTo(timeCheckIn2) < 0) {
      if (timeout.compareTo(timeCheckOut2) > 0) {
        return 'Nửa';
      } else {
        return 'Vắng';
      }
    } else if (timein.compareTo(timeCheckIn2) > 0) {
      return 'Vắng';
    }
    return '';
  }

  static DateTime handleDate(String date, String time) {
    String dateTimeString = '$date ' + '$time';
    DateTime tempDate = DateFormat("MM/dd/yyy hh:mm").parse(dateTimeString);
    return tempDate;
  }
}
