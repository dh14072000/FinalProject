import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController {
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

  RxList<TimeKeepingModel> timeData = <TimeKeepingModel>[].obs;
  getTimeEmployeeData() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('timeData')
        .where('day',
            isEqualTo: DateFormat('MM/dd/yyyy').format(selectedDay.value))
        .get();
    if (snapShort.docs.isNotEmpty) {
      timeData.value =
          snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();
      print(timeData.toString());
    }
  }

  // handle status day
  String statusDay(int index) {
    if (timeData[index].timeIn!.isNotEmpty &&
        timeData[index].timeOut!.isNotEmpty &&
        timeData[index].timeIn != null &&
        timeData[index].timeOut != null) {
      return Utils.checkTimeKeeping(timeData[index].date!,
          timeData[index].timeIn!, timeData[index].timeOut!);
    }
    return 'VA';
  }
}
