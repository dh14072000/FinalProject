import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class ReduceController extends GetxController {
  var time = DateTime.now();
  DateTime appointmentDate = DateTime.now();
  TextEditingController appointmentDateText = TextEditingController();
  TextEditingController reduceController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  CollectionReference reduce = FirebaseFirestore.instance.collection('reduce');


  onreduce(ReduceModel reduceModel) async {
    await reduce.add(reduceModel.toJson()).whenComplete(() {
      Get.snackbar(
        'Thêm thành công', 'Giảm trừ đã được thêm cho nhân viên',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
        Get.close(1);
    } );
    ;
  }
}
