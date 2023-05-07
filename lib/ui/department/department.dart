import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/department_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/profile/profile_admin/constains.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/btn_component/btn_primary.dart';
import 'package:final_project/widget/in_put/edit_info_textfield.dart';
import 'package:final_project/widget/text/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class DepartmentPage extends StatelessWidget {
  var controller = Get.find<DepartmentController>();
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (_, height, width, sy, sx) {
      return Scaffold(
          appBar: ProjectAppBar(
            text: 'Cấu trúc phòng ban',
            backButton: true,
            height: sy(50),
            action: [
              IconButton(
                  onPressed: () {
                    controller.nameController.text = '';
                    controller.coefficientsController.text = '';
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: SmallText(text: 'Thêm phòng ban'),
                            content: Container(
                              height: height / 7,
                              child: Column(children: [
                                RoundTextField(
                                  hint: 'Tên phòng ban',
                                  controller: controller.nameController,
                                ),
                                SizedBox(
                                  height: sx(10),
                                ),
                                RoundTextField(
                                  hint: 'Hệ số lương',
                                  textInputType: TextInputType.number,
                                  controller: controller.coefficientsController,
                                ),
                              ]),
                            ),
                            actions: [
                              PrimaryButton(
                                onPressed: () => Get.back(),
                                renderLabel: SmallText(
                                  text: 'Huỷ',
                                  style: AppFonts.textContent,
                                ),
                              ),
                              SizedBox(
                                height: sx(10),
                              ),
                              PrimaryButton(
                                onPressed: () => controller.addDepartment(),
                                renderLabel: SmallText(
                                  text: 'Xác nhận',
                                  style: AppFonts.textContent,
                                ),
                                backgroundColor: primaryColor,
                              ),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add_circle_outline_outlined))
            ],
          ),
          body: Padding(
            padding:  EdgeInsets.only(top: sy(20),left: sx(10),right: sx(10)),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('department')
                        .where('idCompany',
                            isEqualTo: controller.conpany.admin.id)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: GridView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) => Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kSpacingUnit.w * 3),
                                color: Colors.blue.shade200,
                              ),
                              child: SmallText(
                                  text: snapshot.data!.docs[index].get('name')),
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 180,
                                    childAspectRatio: 3 / 1,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Text('Error');
                      } else
                        return CircularProgressIndicator();
                    }),
              ],
            ),
          ));
    });
  }
}
