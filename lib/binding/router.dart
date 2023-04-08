import 'package:final_project/binding/binding.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/ui/home/home_page.dart';
import 'package:final_project/ui/login/Login_screen.dart';
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
    
  ];
}