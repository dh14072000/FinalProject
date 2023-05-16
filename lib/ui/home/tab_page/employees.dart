import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/employee_controller.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/employees/register_employee.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/card/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class EmployeePage extends StatelessWidget {
  var controller = Get.find<EmployeeController>();
  var detailController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: ProjectAppBar(
          height: sy(50),
          text: detailController.admin.company,
          backButton: false,
          urlImage: detailController.admin.avatar,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: sy(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(colors: [
                          Color(0xFF26CBE6),
                          Color(0xFF26CBC0),
                        ], begin: Alignment.topCenter, end: Alignment.center)),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add_alt,
                            color: whiteColor,
                          ),
                          SizedBox(
                            width: sx(10),
                          ),
                          Text(
                            'Thêm nhân viên'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () => Get.to(() => RegisterEmployeePage()),
                    ),
                  ),
                ],
              ),
            ),
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
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutePaths.PROFILE_EMPLOYEE,
                                      arguments: snapshot.data!.docs[index]);
                                },
                                child: EmployeeCard(
                                  name: snapshot.data!.docs[index].get('name'),
                                  phone:
                                      snapshot.data!.docs[index].get('phone'),
                                      department:  snapshot.data!.docs[index].get('department'),
                                      urlImage: snapshot.data!.docs[index].get('avatar'),
                                ),
                              )),
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
