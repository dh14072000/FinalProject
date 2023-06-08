import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailEmployeeController extends GetxController {
  RxList<double> listSarlay = RxList<double>();

  final box = GetStorage();
  var employeeData = Get.arguments;
  var monthNow = DateTime.now().month;
  List<TimeKeepingModel> dataTimer = [];
  RxDouble sarlayMonthDouble = RxDouble(0.0);
  RxDouble totalSarlay = RxDouble(0.0);
  RxInt bonusCash = RxInt(0);
  RxInt allowanceCash = RxInt(0);
  RxInt reduceCash = RxInt(0);

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

  addListSarlay() {
    var sarlay = box.read('ListSarlay') ?? [];
    listSarlay.value = List.from(sarlay as List);
    listSarlay.value.add(totalSarlay.value as double);
    box.write('ListSarlay', listSarlay.value);
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
              int.parse(Utils.checkSarrlay(e.date!, e.timeIn!, e.timeOut!)) *
                  double.parse(employeeData.get('coefficients'));
          sarlayMonthDouble.value = sarlayMonthDouble.value + sarlayDay;
        } else {
          var sarlayDay =
              int.parse(Utils.checkSarrlay(e.date!, e.timeIn!, e.timeOut!)) *
                  double.parse(employeeData.get('coefficients'));
          sarlayMonthDouble.value = sarlayMonthDouble.value + sarlayDay * 1.2;
        }
      }
    });
  }

  deleteData(BuildContext context) async {
    onLoading(context);
    try {
      var colection = FirebaseFirestore.instance
          .collection('timeData')
          .where('id', isEqualTo: int.parse(employeeData.get('employeeCode')));
      var snapshot = await colection.get();
      for (var e in snapshot.docs) {
        await e.reference.delete();
      }
      await deleteReduceCash();
      await deleteAllowanceCash();
      await deleteBonusCash();
      Get.snackbar('Thành công', 'Tải dữ liệu thành công',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Không thành công', 'Vui lòng kiểm tra lại kết nối của bạn',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
    Get.close(1);
  }

  deleteReduceCash() async {
    var colection = FirebaseFirestore.instance
        .collection('reduce')
        .where('id', isEqualTo: employeeData.get('id'));
    var snapshot = await colection.get();
    for (var e in snapshot.docs) {
      await e.reference.delete();
    }
  }

  deleteBonusCash() async {
    var colection = FirebaseFirestore.instance
        .collection('bonus')
        .where('id', isEqualTo: employeeData.get('id'));
    var snapshot = await colection.get();
    for (var e in snapshot.docs) {
      await e.reference.delete();
    }
  }

  deleteAllowanceCash() async {
    var colection = FirebaseFirestore.instance
        .collection('allowance')
        .where('id', isEqualTo: employeeData.get('id'));
    var snapshot = await colection.get();
    for (var e in snapshot.docs) {
      await e.reference.delete();
    }
  }

  void onLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
          Center(
            child: CircularProgressIndicator(),
          )
            ],
          ),
        );
      },
    );
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
