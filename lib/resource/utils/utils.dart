import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static String checkTimeKeeping(String date, String timeIn, String timeOut) {
    final DateTime? timeCheckIn1 = handleDate(date, '8:00');
    final DateTime? timeCheckIn2 = handleDate(date, '13:00');
    final DateTime? timeCurfewIn = handleDate(date, '8:30');
    final DateTime? timeCheckOut1 = handleDate(date, '12:00');
    final DateTime? timeCheckOut2 = handleDate(date, '17:00');
    final DateTime? timeCurfewOut = handleDate(date, '16:30');
    final DateTime? timein = handleDate(date, timeIn);
    final DateTime? timeout = handleDate(date, timeOut);
    if (timein == null || timeout == null) {
      return 'VA';
    }
    if (timein.compareTo(timeCheckIn1!) <= 0) {
      if (timeout.compareTo(timeCurfewOut!) >= 0 &&
          timeout.compareTo(timeCheckOut2!) < 0) {
        return 'MU';
      } else if (timeout.compareTo(timeCurfewOut) < 0 &&
          timeout.compareTo(timeCheckOut1!) >= 0) {
        return 'NU';
      } else if (timeout.compareTo(timeCheckOut2!) >= 0) {
        return 'DU';
      }
      return 'VA';
    } else if (timein.compareTo(timeCheckIn1) > 0 &&
        timein.compareTo(timeCurfewIn!) <= 0) {
      if (timeout.compareTo(timeCurfewOut!) >= 0 &&
          timeout.compareTo(timeCheckOut2!) < 0) {
        return 'NU';
      } else if (timeout.compareTo(timeCheckOut2!) >= 0) {
        return 'MU';
      }
      return 'VA';
    } else if (timein.compareTo(timeCheckIn2!) < 0) {
      if (timeout.compareTo(timeCheckOut2!) > 0) {
        return 'NU';
      } else {
        return 'VA';
      }
    } else if (timein.compareTo(timeCheckIn2) > 0) {
      return 'VA';
    }
    return 'VA';
  }

  static String checkSarrlay(String date, String timeIn, String timeOut) {
    final DateTime? timeCheckIn1 = handleDate(date, '8:00');
    final DateTime? timeCheckIn2 = handleDate(date, '13:00');
    final DateTime? timeCurfewIn = handleDate(date, '8:30');
    final DateTime? timeCheckOut1 = handleDate(date, '12:00');
    final DateTime? timeCheckOut2 = handleDate(date, '17:00');
    final DateTime? timeCurfewOut = handleDate(date, '16:30');
    final DateTime? timein = handleDate(date, timeIn);
    final DateTime? timeout = handleDate(date, timeOut);
    if (timein == null || timeout == null) {
      return '0';
    }
    if (timein.compareTo(timeCheckIn1!) <= 0) {
      if (timeout.compareTo(timeCurfewOut!) >= 0 &&
          timeout.compareTo(timeCheckOut2!) < 0) {
        return '250000';
      } else if (timeout.compareTo(timeCurfewOut) < 0 &&
          timeout.compareTo(timeCheckOut1!) > 0) {
        return '150000';
      } else if (timeout.compareTo(timeCheckOut2!) >= 0) {
        return '300000';
      }
      return '0';
    } else if (timein.compareTo(timeCheckIn1) > 0 &&
        timein.compareTo(timeCurfewIn!) <= 0) {
      if (timeout.compareTo(timeCurfewOut!) >= 0 &&
          timeout.compareTo(timeCheckOut2!) < 0) {
        return '150000';
      } else if (timeout.compareTo(timeCheckOut2!) >= 0) {
        return '250000';
      }
      return '0';
    } else if (timein.compareTo(timeCheckIn2!) < 0) {
      if (timeout.compareTo(timeCheckOut2!) >= 0) {
        return '150000';
      } else {
        return '0';
      }
    } else if (timein.compareTo(timeCheckIn2) >= 0) {
      return '0';
    }
    return '0';
  }

  static DateTime? handleDate(String date, String? time) {
    String dateTimeString = '$date ' + '$time';
    DateTime? tempDate = time == 'Bỏ lỡ'
        ? null
        : DateFormat("MM/dd/yyy hh:mm").parse(dateTimeString);
    return tempDate;
  }

  static bool checkNull(String? data) {
    if (data == null || data == '') {
      return true;
    } else
      return false;
  }

  static onloading(BuildContext context, fun) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    await fun;
    Get.back();
  }
  static void onLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            height: 200,
            width: 200,
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                 Center(
            child: CircularProgressIndicator(),
          ),
          Text("Đang tải dữ liệu,\n Vui lòng chờ ...",style: TextStyle(fontSize: 30),)
                
              ],
            )
            ),
          ),
        );
      },
    );}
}
