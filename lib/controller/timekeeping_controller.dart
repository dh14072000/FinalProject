import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class TimeKeepingController extends GetxController {
  RxInt currentMonth = DateTime.now().month.obs;
    Rx<DateTime> selectedDay = DateTime.now().obs;
    var supportEvent = Rxn<Map<DateTime, List<CleanCalendarEvent>>>({});

  var daysOfWeek = <String>[
    "Monday".tr,
    "Tuesday".tr,
    "Wednesday".tr,
    "Thursday".tr,
    "Friday".tr,
    "Saturday".tr,
    "Sunday".tr
  ];

  handleNewDate(date) => selectedDay.value = date;

  handleMonthChange(date) {
    if (date.month == currentMonth.value) return;
    currentMonth.value = date.month;
  }
}