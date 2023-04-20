import 'package:final_project/binding/binding.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/ui/employees/function/bonus.dart';
import 'package:final_project/ui/employees/function/pay.dart';
import 'package:final_project/ui/employees/function/reduce.dart';
import 'package:final_project/ui/employees/function/timekeeping.dart';
import 'package:final_project/ui/home/home_page.dart';
import 'package:final_project/ui/login/Login_screen.dart';
import 'package:final_project/ui/profile/edit_info/edit_info_admin.dart';
import 'package:final_project/ui/profile/profile_employee.dart';
import 'package:get/get.dart';

class ProjectRouter {
  static final List<GetPage> pages = [
    GetPage(
      name: RoutePaths.LOGIN,
      page: () => LoginPage(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.HOME_PAGE,
      page: () => TabPage(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.PAY_PAGE,
      page: () => PayPage(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.TIME_KEEPING,
      page: () => TimeKeepingPage(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.BONUS,
      page: () => BonusPage(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.REDUCE,
      page: () => ReducePage(),
      binding: SampleBind(),
    ),

    GetPage(
      name: RoutePaths.PROFILE_EMPLOYEE,
      page: () => FrofileEmployeePage(),
      binding: SampleBind(),
    ),
    GetPage(
      name: RoutePaths.EDIT_INFO_ADMIN,
      page: () => EditInfoAdmin(),
      binding: SampleBind(),
    ),
  ];
}