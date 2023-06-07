import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/chart_controller.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/card/chart_card.dart';
import 'package:final_project/widget/card/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class ChartPage extends StatelessWidget {
  var controller = Get.find<ChartController>();
  var detailController = Get.find<LoginController>();

  ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar:
            ProjectAppBar(text: 'Thống kê', height: sy(50), backButton: true),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('employees')
                    .where('idCompany', isEqualTo: detailController.admin.id)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () =>  Get.toNamed(RoutePaths.TIME_KEEPING,
                                      arguments: snapshot.data!.docs[index]),
                              child: Obx(() => ChartCard(
                                name: snapshot.data!.docs[index].get('name'),
                                phone: snapshot.data!.docs[index].get('phone'),
                                department: snapshot.data!.docs[index]
                                    .get('department'),
                                urlImage:
                                    snapshot.data!.docs[index].get('avatar'),
                                listDU: controller.listEmpDayInfo != []
                                    ? '${controller.listEmpDayInfo.elementAt(index)["full"]}'
                                    : '0',
                                listMU: controller.listEmpDayInfo != []
                                    ? '${controller.listEmpDayInfo.elementAt(index)["late"]}'
                                    : '0',
                                listNU: controller.listEmpDayInfo != []
                                    ? '${controller.listEmpDayInfo.elementAt(index)["half"]}'
                                    : '0',
                                listVA: controller.listEmpDayInfo != []
                                    ? '${controller.listEmpDayInfo.elementAt(index)["off"]}'
                                    : '0',
                              ),)

                              // child: ChartCard(
                              //   name: snapshot.data!.docs[index].get('name'),
                              //   phone:
                              //       "Time-data: ${controller.listEmpDayInfo.elementAt(index)["working-day"]}",
                              //   department:
                              //       "Ngày làm đủ: ${controller.listEmpDayInfo.elementAt(index)["full"]} Ngày nghỉ làm: ${controller.listEmpDayInfo.elementAt(index)["off"]}\nNgày làm nửa: ${controller.listEmpDayInfo.elementAt(index)["half"]} Ngày đến muộn: ${controller.listEmpDayInfo.elementAt(index)["late"]}",
                              //   urlImage:
                              //       snapshot.data!.docs[index].get('avatar'),
                              // ),
                            );
                          }),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      );
    });
  }
}
