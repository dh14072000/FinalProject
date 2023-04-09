import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class BonusController extends GetxController with GetTickerProviderStateMixin {
   late TabController recommendationTab;

   @override
  onInit() {
    super.onInit();
    recommendationTab = TabController(length: 2, vsync: this);
  }

}