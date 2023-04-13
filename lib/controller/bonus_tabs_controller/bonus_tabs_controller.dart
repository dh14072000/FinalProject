import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class BonusTabController extends GetxController {
  var time = DateTime.now();
  DateTime appointmentDate = DateTime.now();
  TextEditingController appointmentDateText = TextEditingController();
  TextEditingController bonusController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  CollectionReference bonus = FirebaseFirestore.instance.collection('bonus');


  onBonus(ReduceModel bonusModel) async {
    await bonus.add(bonusModel.toJson()).whenComplete(() {
      Get.snackbar(
        'Thêm thành công', 'Giảm trừ đã được thêm cho nhân viên',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
        Get.close(1);
    } );
    ;
  }
}
