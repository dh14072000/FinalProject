import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailEmployeeController extends GetxController {
  var employeeData = Get.arguments;
  var monthNow = DateTime.now().month;
  List<TimeKeepingModel> dataTimer = [];
  RxInt sarlayMonth = RxInt(0);

  // getTimeData() async {
  //   final snapShort = await FirebaseFirestore.instance
  //       .collection('timeData')
  //       .where('id', isEqualTo: int.parse(employeeData.get('employeeCode')))
  //       .get();
  //   if (snapShort.docs.isNotEmpty) {
  //     dataTimer =
  //         snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();
  //   }
  // }

  getSarlayMonth() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('timeData')
        .where('id', isEqualTo: int.parse(employeeData.get('employeeCode')))
        .get();
    if (snapShort.docs.isNotEmpty) {
      dataTimer =
          snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();
    }
    dataTimer.forEach((e) {
      if (e.timeIn != null &&
          e.timeIn!.isNotEmpty &&
          e.timeOut != null &&
          e.timeOut!.isNotEmpty) {

        var sarlayDay = Utils.checkSarrlay(e.date!, e.timeIn!, e.timeOut!);
        sarlayMonth = sarlayMonth + int.parse(sarlayDay);
      }
    });
  }
}
