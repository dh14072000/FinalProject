import 'package:final_project/ui/home/tab_page/employees.dart';
import 'package:final_project/ui/home/tab_page/schedule_month.dart';
import 'package:final_project/ui/profile/profile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentTabIndex = 0.obs;

  List<Widget> pages = [EmployeePage(), SchedulePage(), Container(), ProfilePage()];
  Widget get currentPage => pages[currentTabIndex.value];
}
