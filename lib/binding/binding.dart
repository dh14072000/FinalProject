import 'package:final_project/controller/employee_controller.dart';
import 'package:final_project/controller/home_controller.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/controller/register_admin_controller.dart';
import 'package:final_project/controller/register_employee_controller.dart';
import 'package:final_project/controller/schadule_month_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RegisterAdminController>(() => RegisterAdminController());
    Get.lazyPut<RegisterEmployeeController>(() => RegisterEmployeeController());
    Get.lazyPut<ScheduleController>(() => ScheduleController());
    Get.lazyPut<EmployeeController>(() => EmployeeController());
  }
}
