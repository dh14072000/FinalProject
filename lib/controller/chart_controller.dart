import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:get/get.dart';

import '../resource/utils/utils.dart';

class ChartController extends GetxController {
  var detailController = Get.find<LoginController>();
  var listEmp = <int>[];
  var listEmpDayInfo = <Map<String, int>>[];
  List<Map<String, int>> dayInfo = [];

  List<TimeKeepingModel> dataTimer = [];
  RxList listTimeDu = [].obs;
  RxList listTimeMu = [].obs;
  RxList listTimeNu = [].obs;
  RxList listTimeVa = [].obs;

  @override
  onInit() async {
    super.onInit();
    await FirebaseFirestore.instance
        .collection('employees')
        .where('idCompany', isEqualTo: detailController.admin.id)
        .get()
        .then((value) {
      listEmp =
          value.docs.map((e) => int.parse(e.get('employeeCode'))).toList();
    });

    listEmpDayInfo = await Future.wait(
        listEmp.map((e) async => await getSarlayMonth(e)).toList());
  }

  Future<Map<String, int>> getSarlayMonth(int id) async {
    dataTimer.clear();
    var fullDay = 0;
    var offDay = 0;
    var halfDay = 0;
    var lateDay = 0;

    final snapShort = await FirebaseFirestore.instance
        .collection('timeData')
        .where('id', isEqualTo: id)
        .get();
    if (snapShort.docs.isNotEmpty) {
      dataTimer =
          snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();
    }
    for (var e in dataTimer) {
      if (e.timeIn != null &&
          e.timeIn!.isNotEmpty &&
          e.timeOut != null &&
          e.timeOut!.isNotEmpty) {
        var status = Utils.checkTimeKeeping(e.date!, e.timeIn!, e.timeOut!);
        if (status == 'DU') {
          fullDay += 1;
        } else if (status == 'MU') {
          lateDay += 1;
        } else if (status == 'NU') {
          halfDay += 1;
        } else {
          offDay += 1;
        }
      }
    }

    return {
      "full": fullDay,
      "off": offDay,
      "half": halfDay,
      "late": lateDay,
      "working-day": dataTimer.length
    };
  }
}
