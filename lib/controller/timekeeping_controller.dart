import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class TimeKeepingController extends GetxController {
  var employee = Get.find<DetailEmployeeController>();

// month data
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


  //employee data
  Rx<TimeKeepingModel> timeData = TimeKeepingModel().obs ;
  getTimeEmployeeData() async {
    timeData.value = TimeKeepingModel() ;
    print(DateFormat('MM/dd/yyyy').format(selectedDay.value));
    print(employee.employeeData.get('id').runtimeType);
    final snapShort = await FirebaseFirestore.instance
          .collection('timeData')
          .where('id',isEqualTo:int.parse(employee.employeeData.get('id')))
        .where('day',isEqualTo: DateFormat('MM/dd/yyyy').format(selectedDay.value))
        .get();
        if(snapShort.docs.isNotEmpty){
          timeData.value = snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).single;
          print(timeData.value.toString());
        } 
    
    print(timeData.value.toString());
  }

  // handle status day
  RxString statusDay(){
    if(timeData.value.id != null){return Utils.checkTimeKeeping(timeData.value.date!, timeData.value.timeIn!, timeData.value.timeOut!).obs;}
    return 'VA'.obs;
    
  }
}