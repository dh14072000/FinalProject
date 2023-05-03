import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class FrofileEmployeePage extends StatelessWidget {
  var detailEmployee = Get.find<DetailEmployeeController>();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF26CBE6),
              Color(0xFF26CBC0),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 30),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Get.back(),
                        ))
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: _height / 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                child: CircleImage(
                  widthImg: 150,
                  heightImg: 150,
                  urlImg: detailEmployee.employeeData.get('avatar'),
                  borderRadius: 100,
                ),
              ),
                        SizedBox(
                          height: _height / 30,
                        ),
                        Text(
                          detailEmployee.employeeData.get('name'),
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height / 2.2),
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _height / 2.6,
                      left: _width / 20,
                      right: _width / 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 2.0,
                                  offset: Offset(0.0, 2.0))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: _width / 20, bottom: _width / 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                headerChild(
                                    Icons.alarm_on_outlined, 'Bảng công',
                                    () async {
                                  Get.toNamed(RoutePaths.TIME_KEEPING,
                                      arguments: detailEmployee.employeeData);
                                }),
                                headerChild(Icons.credit_card, 'Thanh toán',
                                    () async {
                                  detailEmployee.getData();
                                  Get.toNamed(RoutePaths.PAY_PAGE,
                                      arguments: detailEmployee.employeeData);
                                }),
                                headerChild(
                                    Icons.attach_money,
                                    'Thưởng',
                                    () => Get.toNamed(RoutePaths.BONUS,
                                        arguments:
                                            detailEmployee.employeeData)),
                                headerChild(
                                    Icons.money_off,
                                    'Giảm trừ',
                                    () => Get.toNamed(RoutePaths.REDUCE,
                                        arguments:
                                            detailEmployee.employeeData)),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _height / 20),
                        child: Column(
                          children: <Widget>[
                            infoChild(
                                width: _width,
                                icon: Icons.email,
                                data: detailEmployee.employeeData.get('email')),
                            infoChild(
                              width: _width,
                              icon: Icons.call,
                              data: detailEmployee.employeeData.get('phone'),
                              ontap: () async =>
                                  await FlutterPhoneDirectCaller.callNumber(
                                      '${detailEmployee.employeeData.get('phone')}'),
                            ),
                            infoChild(
                                width: _width,
                                icon: Icons.group_add,
                                data: detailEmployee.employeeData.get('age')),
                            Padding(
                              padding: EdgeInsets.only(top: _height / 30),
                              child: GestureDetector(
                                onTap: () =>
                                    Get.toNamed(RoutePaths.EDIT_INFO_EMPLOYEE),
                                child: Container(
                                  width: _width / 3,
                                  height: _height / 20,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF26CBE6),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(_height / 40)),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black87,
                                            blurRadius: 2.0,
                                            offset: Offset(0.0, 1.0))
                                      ]),
                                  child: const Center(
                                    child: Text('Sửa tài khoản',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headerChild(IconData icon, String text, VoidCallback ontap) =>
      Expanded(
          child: GestureDetector(
        onTap: ontap,
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 24,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF26CBE6),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ));

  Widget infoChild(
          {required double width,
          required IconData icon,
          data,
          VoidCallback? ontap}) =>
      Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: ontap,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(
                data,
                style: AppFonts.textContent,
              )
            ],
          ),
        ),
      );
}
