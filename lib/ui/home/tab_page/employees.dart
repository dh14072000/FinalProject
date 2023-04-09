import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/employee_controller.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/employees/employee_detail.dart';
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
          text:detailController.admin.company,
          backButton: false,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: sy(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
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
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () => Get.to(() => EmployeeDetail(),
                                    arguments: snapshot.data!.docs[index]),
                                child: EmployeeCard(
                                  name: snapshot.data!.docs[index].get('name'),
                                  salary: '150.000',
                                  // salary: snapshot.data!.docs[index].get('email')
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
