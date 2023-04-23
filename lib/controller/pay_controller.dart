import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PayController extends GetxController {
  var employee = Get.find<DetailEmployeeController>();

  var monthNow = DateTime.now().month;
 
  
  //get list  timedata employee
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