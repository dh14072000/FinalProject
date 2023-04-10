import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/employees/function/bonus.dart';
import 'package:final_project/ui/employees/function/pay.dart';
import 'package:final_project/ui/employees/function/reduce.dart';
import 'package:final_project/ui/employees/function/timekeeping.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

// ignore: must_be_immutable
class EmployeeDetail extends StatelessWidget{
  var controller = Get.find<DetailEmployeeController>();


  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: ProjectAppBar(
          height: sy(50),
          backButton: true,
          text: '${controller.argument.get('name')}',
          aligement: Alignment.centerLeft,
          action: [
            IconButton(
              onPressed: () async => await FlutterPhoneDirectCaller.callNumber('${controller.argument.get('phone')}'),
              icon: const Icon(Icons.phone),
              color: inProgressTextColor,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              color: inProgressTextColor,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: sy(10)),
                height: sy(50),
                decoration: BoxDecoration(color: whiteColor, boxShadow: [
                  BoxShadow(
                      color: greyTextColor,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(0, 0))
                ]),
                child: Row(children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'images/pay.png',
                          fit: BoxFit.fill,
                        ),
                      )),
                  SizedBox(
                    width: sx(20),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(right: sx(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Lương tháng ' + '${controller.monthNow}',
                                    style: AppFonts.textDark16,
                                  ),
                                  Text(
                                    '150.000',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: inProgressTextColor),
                                  )
                                ]),
                            const Text('Thanh toán'),
                          ],
                        ),
                      ))
                ]),
              ),
              Container(
                  margin: EdgeInsets.only(top: sy(10)),
                  padding: const EdgeInsets.all(10),
                  height: sy(140),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                        color: greyTextColor,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(0, 0))
                  ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(RoutePaths.TIME_KEEPING,arguments: controller.argument),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: sx(10),
                                  bottom: sx(10),
                                  left: sx(10),
                                  right: sx(25)),
                              padding: EdgeInsets.all(sx(10)),
                              child: Column(children: [
                                Image.asset(
                                  'images/đồng_hồ.png',
                                  height: sx(50),
                                ),
                                SizedBox(
                                  height: sx(5),
                                ),
                                const Text('Công')
                              ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(RoutePaths.PAY_PAGE,arguments: controller.argument),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: sx(10),
                                  bottom: sx(10),
                                  left: sx(10),
                                  right: sx(25)),
                              padding: EdgeInsets.all(sx(10)),
                              child: Column(children: [
                                Image.asset('images/thanh_toán.png',
                                    height: sx(50)),
                                SizedBox(
                                  height: sx(5),
                                ),
                                const Text('Thanh toán')
                              ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(RoutePaths.BONUS,arguments: controller.argument),
                            child: Container(
                              margin: EdgeInsets.all(sx(10)),
                              padding: EdgeInsets.all(sx(10)),
                              child: Column(children: [
                                Image.asset(
                                  'images/phụ_cấp.png',
                                  height: sx(50),
                                ),
                                SizedBox(
                                  height: sx(5),
                                ),
                                const Text('Phụ cấp/thưởng')
                              ]),
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(RoutePaths.REDUCE,arguments: controller.argument),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: sx(10),
                                  bottom: sx(10),
                                  left: sx(10),
                                  right: sx(25)),
                              padding: EdgeInsets.all(sx(10)),
                              child: Column(children: [
                                Image.asset('images/giảm_lương.png',
                                    height: 40),
                                SizedBox(
                                  height: sx(5),
                                ),
                                const Text('Giảm trừ')
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
