
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class ReduceController extends GetxController {
  var time = DateTime.now();
  RxList<DateTime?> appointmentDate = [DateTime.now()].obs;
    TextEditingController appointmentDateText = TextEditingController();
    TextEditingController reduceController= TextEditingController();
     final List<DateTime?> date = [DateTime.now()];
}