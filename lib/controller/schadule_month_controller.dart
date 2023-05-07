import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController {
  RxInt currentMonth = DateTime.now().month.obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  var listEvent = <DateTime, List<CleanCalendarEvent>>{};
  late String urlImage;
  RxString avatar = RxString('');

  var daysOfWeek = <String>[
    "Monday".tr,
    "Tuesday".tr,
    "Wednesday".tr,
    "Thursday".tr,
    "Friday".tr,
    "Saturday".tr,
    "Sunday".tr
  ];

  @override
  onInit() async {
    super.onInit();
    await getUserTimeDataColl();
  }

  getUserTimeDataColl() async {
    final snapShot =
        await FirebaseFirestore.instance.collection('timeData').get();

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

  handleNewDate(date) => selectedDay.value = date;

  handleMonthChange(date) {
    if (date.month == currentMonth.value) return;
    currentMonth.value = date.month;
  }

  RxList<TimeKeepingModel> timeData = <TimeKeepingModel>[].obs;
  getTimeEmployeeData() async {
         timeData.clear();
    final snapShort = await FirebaseFirestore.instance
        .collection('timeData')
        .where('day',
            isEqualTo: DateFormat('MM/dd/yyyy').format(selectedDay.value))
        .get();
    if (snapShort.docs.isNotEmpty) {
      timeData.value =
          snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();
      print(timeData.toString());
      print(timeData.length);
    } else {
      timeData.value = [];
    }
    for (var element in timeData) {
      var employee = await FirebaseFirestore.instance
        .collection('employees')
        .where('employeeCode',
            isEqualTo: element.id.toString())
        .get();
        element.avatar!.value = employee.docs.map((e) => e.get('avatar')).single;
     }
    return;
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
