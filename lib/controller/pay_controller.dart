import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PayController extends GetxController {
  var employee = Get.find<DetailEmployeeController>();
  var monthNow = DateTime.now().month;
}

