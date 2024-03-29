import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class AllowanceController extends GetxController {
  var time = DateTime.now();
  DateTime appointmentDate = DateTime.now();
  TextEditingController appointmentDateText = TextEditingController();
  TextEditingController allowanceController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  CollectionReference allowance = FirebaseFirestore.instance.collection('allowance');


  onAllowance(ReduceModel allowanceModel) async {
    await allowance.add(allowanceModel.toJson()).whenComplete(() {
      Get.snackbar(
        'Thêm thành công', 'Phụ cấp đã được thêm cho nhân viên',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
        Get.close(1);
    } );
    ;
  }
}
