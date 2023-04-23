// import 'dart:convert';

// import 'package:final_project/resource/definition_color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
// import 'package:get/get.dart';

// mixin CalendarProvince {
//   RxInt currentMonth = DateTime.now().month.obs;
//   Rxn<String> validateReasonMsg = Rxn();
//   String reason = '';
//   Rx<DateTime> selectedDay = DateTime.now().obs;

//   var supportEvent = Rxn<Map<DateTime, List<CleanCalendarEvent>>>({});

//   var daysOfWeek = <String>[
//     "Monday".tr,
//     "Tuesday".tr,
//     "Wednesday".tr,
//     "Thursday".tr,
//     "Friday".tr,
//     "Saturday".tr,
//     "Sunday".tr
//   ];


//   callApiAndParseResponse() {
//     handleNewDate(DateTime(
//         DateTime.now().year, DateTime.now().month, DateTime.now().day));
//   }

//   handleNewDate(date) => selectedDay.value = date;

//   handleMonthChange(date) {
//     if (date.month == currentMonth.value) return;
//     currentMonth.value = date.month;
//   }

//   resetReasonField() {
//     reason = '';
//     validateReasonMsg.value = null;
//   }

//   void addValueToMap(Map<DateTime, List<CleanCalendarEvent>> map, DateTime key,
//           CleanCalendarEvent value) =>
//       map.update(key, (list) {
//         var presentEvent = map[key]!.first;
//         List<int> currentTicketId = parseListTicketId(presentEvent.summary);
//         int newTicketId = parseListTicketId(value.summary).first;
//         currentTicketId.add(newTicketId);

//         return [
//           CleanCalendarEvent(currentTicketId.toString(),
//               startTime: value.startTime, endTime: value.endTime)
//         ];
//       }, ifAbsent: () => [value]);

//   List<int> parseListTicketId(String list) =>
//       json.decode(list).cast<int>().toList();

//   int firstDayOfCurrentMonth(int currentMonth) =>
//       DateTime(DateTime.now().year, currentMonth, 1).millisecondsSinceEpoch;

//   int lastDayOfCurrentMonth(int currentMonth) =>
//       DateTime(DateTime.now().year, currentMonth + 1, 0).millisecondsSinceEpoch;
// }
