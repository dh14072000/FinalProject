import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/chart_controller.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/card/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class ChartPage extends StatelessWidget {
  var controller = Get.find<ChartController>();
  var detailController = Get.find<LoginController>();

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
                            controller.getSarlayMonth(int.parse(snapshot
                                .data!.docs[index]
                                .get('employeeCode')));
                            return GestureDetector(
                              // onTap: () {
                              //   Get.toNamed(RoutePaths.PROFILE_EMPLOYEE,
                              //       arguments: snapshot.data!.docs[index]);
                              // },
                              child: EmployeeCard(
                                name: snapshot.data!.docs[index].get('name'),
                                phone: controller.listTimeDu.length.toString(),
                                department: controller.listTimeVa.length.toString(),
                                urlImage:
                                    snapshot.data!.docs[index].get('avatar'),
                              ),
                            );
                          }),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Error');
                  } else
                    return CircularProgressIndicator();
                })
          ],
        ),
      );
    });
  }
}
