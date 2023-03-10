import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/home/tab_page/employees.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabPage extends StatelessWidget {
  RxInt currentTabIndex = 0.obs;

  List<Widget> pages = [
    EmployeePage(),
    Container(),
    Container(),
    Container()
  ];
  Widget get currentPage => pages[currentTabIndex.value];

  void changePage(int index) {
    currentTabIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Obx(() => Scaffold(
            body: IndexedStack(
              index: currentTabIndex.value,
              children: pages,
            ),
            bottomNavigationBar: Container(
              height: 90,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: currentTabIndex.value,
                onTap: changePage,
                selectedItemColor: blueColor,
                unselectedItemColor: Colors.black,
                backgroundColor: whiteColor,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      label: 'Nhân viên'.tr,
                      backgroundColor: Colors.red),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: 'Tháng'.tr,
                      backgroundColor: Colors.red),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.calendar_today_sharp),
                      label: 'Ngày'.tr,
                      backgroundColor: Colors.red),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.settings),
                      label: 'Tài khoản'.tr,
                      backgroundColor: Colors.red),
                ],
              ),
            ),
          ));
    });
  }
}
