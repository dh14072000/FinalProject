import 'package:final_project/controller/pay_controller.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
              margin: EdgeInsets.all(20),
              child: Text('Thanh toán lương tháng ' + "${controller.monthNow}",),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text("${controller.employee.sarlayMonth}",),
            ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
              margin: EdgeInsets.all(20),
              child: Text('Thưởng tháng' + "${controller.monthNow}",),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text("${controller.employee.sarlayMonth}",),
            ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
              margin: EdgeInsets.all(20),
              child: Text('Giảm trừ tháng ' + "${controller.monthNow}",),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text("${controller.employee.sarlayMonth}",),
            ),
              ],
            )
          ],
        ),
      );
    });
  }
}
