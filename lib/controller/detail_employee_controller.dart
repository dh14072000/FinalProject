import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:get/get.dart';

class DetailEmployeeController extends GetxController {
  var employeeData = Get.arguments;
  var monthNow = DateTime.now().month;
  List<TimeKeepingModel> dataTimer = [];
  RxDouble sarlayMonthDouble = RxDouble(0.0);
  RxDouble totalSarlay = RxDouble(0.0);
  RxInt bonusCash = RxInt(0);
  RxInt allowanceCash = RxInt(0);
  RxInt reduceCash = RxInt(0);
  RxList<double> listSarlay = RxList<double>();

  void getData() {
    sarlayMonthDouble.value = 0.0;
    bonusCash.value = 0;
    allowanceCash.value = 0;
    reduceCash.value = 0;
    getSarlayMonth();
    getBonusCash();
    getAllowanceCash();
    getReduceCash();
  }

  addSarlay(){
     listSarlay.add(totalSarlay.value);
    print(listSarlay );
  }

  getTotalSarlay() {
    return totalSarlay.value = sarlayMonthDouble.value +
        bonusCash.value +
        allowanceCash.value -
        reduceCash.value;
  }

  getSarlayMonth() async {
    dataTimer.clear();
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
        if (employeeData.get('position') == 'Nhân viên') {
          var sarlayDay =
              int.parse(Utils.checkSarrlay(e.date!, e.timeIn!, e.timeOut!))*double.parse(employeeData.get('coefficients'));
          sarlayMonthDouble.value = sarlayMonthDouble.value + sarlayDay;
        } else {
          var sarlayDay =
              int.parse(Utils.checkSarrlay(e.date!, e.timeIn!, e.timeOut!))*double.parse(employeeData.get('coefficients'));
          sarlayMonthDouble.value = sarlayMonthDouble.value + sarlayDay*1.2;
        }
      }
    });
  }

  // get reduce data employee
  List<ReduceModel> listReduceCash = [];
  getReduceCash() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('reduce')
        .where('id', isEqualTo: employeeData.get('id'))
        .get();
    if (snapShort.docs.isNotEmpty) {
      listReduceCash =
          snapShort.docs.map((e) => ReduceModel.formSnapShort(e)).toList();
      print(listReduceCash.toString());
    }
    for (var e in listReduceCash) {
      reduceCash = reduceCash + int.parse(e.cash!);
    }
    print('giảm trừ $reduceCash');
  }

// get reduce data employee
  List<ReduceModel> listBonusCash = [];
  getBonusCash() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('bonus')
        .where('id', isEqualTo: employeeData.get('id'))
        .get();
    if (snapShort.docs.isNotEmpty) {
      listBonusCash =
          snapShort.docs.map((e) => ReduceModel.formSnapShort(e)).toList();
      print(listBonusCash.toString());
    }
    for (var e in listBonusCash) {
      bonusCash = bonusCash + int.parse(e.cash!);
    }
    print('thưởng $bonusCash');
  }

// get reduce data employee
  List<ReduceModel> listAllowanceCash = [];
  getAllowanceCash() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('allowance')
        .where('id', isEqualTo: employeeData.get('id'))
        .get();
    if (snapShort.docs.isNotEmpty) {
      listAllowanceCash =
          snapShort.docs.map((e) => ReduceModel.formSnapShort(e)).toList();
      print(listAllowanceCash.toString());
    }
    for (var e in listAllowanceCash) {
      allowanceCash = allowanceCash + int.parse(e.cash!);
    }
    print('phụ cấp $allowanceCash');
  }
}
