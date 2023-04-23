import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailEmployeeController extends GetxController {
  var employeeData = Get.arguments;
  var monthNow = DateTime.now().month;
  List<TimeKeepingModel> dataTimer = [];
  RxInt sarlayMonth = RxInt(0);
  RxInt bonusCash = RxInt(0);
  RxInt allowanceCash = RxInt(0);
  RxInt reduceCash = RxInt(0);

  getSarlayMonth() async {
    List<TimeKeepingModel> dataTimer = [];
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

  // get reduce data employee
  List<ReduceModel> listReduceCash = [];
  getReduceCash() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('reduce')
        .where('id', isEqualTo: int.parse(employeeData.get('employeeCode')))
        .get();
    if (snapShort.docs.isNotEmpty) {
      listReduceCash =
          snapShort.docs.map((e) => ReduceModel.formSnapShort(e)).toList();
      print(listReduceCash.toString());
    }
    for (var e in listReduceCash) {
      reduceCash = reduceCash + int.parse(e.cash!);
    }
    print(reduceCash);
  }

// get reduce data employee
  List<ReduceModel> listBonusCash = [];
  getBonusCash() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('bonus')
        .where('id', isEqualTo: int.parse(employeeData.get('employeeCode')))
        .get();
    if (snapShort.docs.isNotEmpty) {
      listBonusCash =
          snapShort.docs.map((e) => ReduceModel.formSnapShort(e)).toList();
      print(listBonusCash.toString());
    }
    for (var e in listBonusCash) {
      bonusCash = bonusCash + int.parse(e.cash!);
    }
    print(bonusCash);
  }

// get reduce data employee
  List<ReduceModel> listAllowanceCash = [];
  getAllowanceCash() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('allowance')
        .where('id', isEqualTo: int.parse(employeeData.get('employeeCode')))
        .get();
    if (snapShort.docs.isNotEmpty) {
      listAllowanceCash =
          snapShort.docs.map((e) => ReduceModel.formSnapShort(e)).toList();
      print(listAllowanceCash.toString());
    }
    for (var e in listAllowanceCash) {
      allowanceCash = allowanceCash + int.parse(e.cash!);
    }
    print(allowanceCash);
  }
}
