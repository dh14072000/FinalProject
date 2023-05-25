import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/pay_controller.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class PayPage extends StatelessWidget {
  PayPage({super.key});
  var controller = Get.find<PayController>();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (_, height, width, sy, sx) {
      return Scaffold(
        appBar: ProjectAppBar(
          height: sy(50),
          backButton: true,
          text: '${controller.employee.employeeData.get('name')}',
          aligement: Alignment.centerLeft,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Thanh toán lương tháng ' + "${controller.monthNow}",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text("${controller.employee.sarlayMonthDouble}",
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.green)),
                  ),
                ],
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Thưởng tháng' + "${controller.monthNow}",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print(controller.employee.bonusCash);
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Text("${controller.employee.bonusCash}",
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.green)),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Phụ cấp tháng ' + "${controller.monthNow}",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text("${controller.employee.allowanceCash}",
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.green)),
                  ),
                ],
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Giảm trừ tháng' + "${controller.monthNow}",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text("${controller.employee.reduceCash}",
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.green)),
                  ),
                ],
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Quyết toán tháng' + "${controller.monthNow}",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(controller.employee.getTotalSarlay().toString(),
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.green)),
                  ),
                ],
              ),
            ),
            Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Text(
                    "Lưu thanh toán".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () => Get.toNamed(RoutePaths.PAY_ADMIN,arguments: controller.employee.getTotalSarlay()),
              ),
            ),
          ],
        ),
      );
    });
  }
}
