import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeKeepingController extends GetxController {
  var employee = Get.find<DetailEmployeeController>();

// month data
  RxInt currentMonth = DateTime.now().month.obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  var listEvent = <DateTime, List<CleanCalendarEvent>>{};

  @override
  onInit() async {
    super.onInit();
    await getUserTimeDataColl();
  }

  getUserTimeDataColl() async {
    final snapShot = await FirebaseFirestore.instance
        .collection('timeData')
        .where('id',
            isEqualTo: int.parse(employee.employeeData.get('employeeCode')))
        .get();

    var listTimeData =
        snapShot.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();

    for (var timeData in listTimeData) {
      var date = timeDataDateToDateTime(timeData.date);
      var event = CleanCalendarEvent("summary",
          startTime: date, endTime: date, isDone: true);

      listEvent.update(date, (value) => [event], ifAbsent: () => [event]);
    }
  }

  DateTime timeDataDateToDateTime(String? date) {
    var dateArr = date!.split('/');
    var month = int.parse(dateArr.first);
    var year = int.parse(dateArr.last);
    var day = int.parse(dateArr.elementAt(1));

    return DateTime(year, month, day);
  }

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

  //employee data
  Rx<TimeKeepingModel> timeData = TimeKeepingModel().obs;
  getTimeEmployeeData() async {
    timeData.value = TimeKeepingModel();
    final snapShort = await FirebaseFirestore.instance
        .collection('timeData')
        .where('id',
            isEqualTo: int.parse(employee.employeeData.get('employeeCode')))
        .where('day',
            isEqualTo: DateFormat('M/d/yyyy').format(selectedDay.value))
        .get();
    if (snapShort.docs.isNotEmpty) {
      timeData.value =
          snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).first;
    }
  }

  // handle status day
  RxString statusDay() {
    if (timeData.value.timeIn != null &&
        timeData.value.timeIn!.isNotEmpty &&
        timeData.value.timeOut != null &&
        timeData.value.timeOut!.isNotEmpty &&
        timeData.value.timeIn != 'Bỏ lỡ' &&
        timeData.value.timeOut != 'Bỏ lỡ') {
      return Utils.checkTimeKeeping(timeData.value.date!,
              timeData.value.timeIn!, timeData.value.timeOut!)
          .obs;
    }
    return 'VA'.obs;
  }

  RxString handleSarlay() {
    if (timeData.value.timeIn != null &&
        timeData.value.timeIn!.isNotEmpty &&
        timeData.value.timeOut != null &&
        timeData.value.timeOut!.isNotEmpty) {
      if (employee.employeeData.get('position') == 'Nhân viên') {
        return (int.parse(Utils.checkSarrlay(timeData.value.date!,
                    timeData.value.timeIn!, timeData.value.timeOut!)) *
                double.parse(employee.employeeData.get('coefficients')))
            .toString()
            .obs;
      } else {
        return (int.parse(Utils.checkSarrlay(timeData.value.date!,
                    timeData.value.timeIn!, timeData.value.timeOut!)) *
                1.2 *
                double.parse(employee.employeeData.get('coefficients')))
            .toString()
            .obs;
      }
    }
    return '0'.obs;
  }
}
