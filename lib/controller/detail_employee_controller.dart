import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class  DetailEmployeeController extends GetxController {
    var employeeData = Get.arguments;
  var monthNow = DateTime.now().month;
    List<TimeKeepingModel> dataTimer = [];
  getTimeData() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('timeData')
        .where('id',
            isEqualTo: int.parse(employeeData.get('employeeCode')))
        .get();
    if (snapShort.docs.isNotEmpty) {
      dataTimer =
          snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();
      print(dataTimer.toString());
    }
  }
}
