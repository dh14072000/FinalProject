import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class PayController extends GetxController {
  var employee = Get.find<DetailEmployeeController>();

  var monthNow = DateTime.now().month;

  List<TimeKeepingModel> timeData = [];
  getTimeEmployeeData() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('timeData')
        .where('id',
            isEqualTo: int.parse(employee.employeeData.get('employeeCode')))
        .get();
    if (snapShort.docs.isNotEmpty) {
      timeData=
          snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();
      print(timeData.toString());
    }
    print(timeData.toString());
  }


}
