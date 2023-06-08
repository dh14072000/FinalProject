import 'package:final_project/controller/bonus_controller.dart';
import 'package:final_project/controller/bonus_tabs_controller/allowance_tabs_page.dart';
import 'package:final_project/controller/bonus_tabs_controller/bonus_tabs_controller.dart';
import 'package:final_project/controller/chart_controller.dart';
import 'package:final_project/controller/department_controller.dart';
import 'package:final_project/controller/edit_info_controller/edit_info_admin_controller.dart';
import 'package:final_project/controller/edit_info_controller/edit_info_employee_controller.dart';
import 'package:final_project/controller/employee_controller.dart';
import 'package:final_project/controller/home_controller.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/controller/pay_admin_controller.dart';
import 'package:final_project/controller/pay_controller.dart';
import 'package:final_project/controller/profile_admin_controller.dart';
import 'package:final_project/controller/reduce_controller.dart';
import 'package:final_project/controller/register_admin_controller.dart';
import 'package:final_project/controller/register_employee_controller.dart';
import 'package:final_project/controller/schadule_month_controller.dart';
import 'package:final_project/controller/timekeeping_controller.dart';
import 'package:get/get.dart';

import '../controller/detail_employee_controller.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RegisterAdminController>(() => RegisterAdminController());
    Get.lazyPut<RegisterEmployeeController>(() => RegisterEmployeeController());
    Get.lazyPut<ScheduleController>(() => ScheduleController());
    Get.lazyPut<EmployeeController>(() => EmployeeController());
    Get.lazyPut<PayController>(() => PayController());
    Get.lazyPut<TimeKeepingController>(() => TimeKeepingController());
    Get.lazyPut<BonusController>(() => BonusController());
    Get.lazyPut<ReduceController>(() => ReduceController());
    Get.lazyPut<DetailEmployeeController>(() => DetailEmployeeController());
    Get.lazyPut<BonusTabController>(() => BonusTabController());
    Get.lazyPut<AllowanceController>(() => AllowanceController());
    Get.lazyPut<ProfileAdminController>(() => ProfileAdminController());
    Get.lazyPut<EditInfoAdminController>(() => EditInfoAdminController());
    Get.lazyPut<EditInfoEmployeeController>(() => EditInfoEmployeeController());
    Get.lazyPut<DepartmentController>(() => DepartmentController());
    Get.lazyPut<ChartController>(() => ChartController());
    Get.lazyPut<PayAdminController>(() => PayAdminController());
  }
}
