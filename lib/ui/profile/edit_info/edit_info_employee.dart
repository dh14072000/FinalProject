import 'dart:async';

import 'package:final_project/controller/edit_info_controller/edit_info_admin_controller.dart';
import 'package:final_project/controller/edit_info_controller/edit_info_employee_controller.dart';
import 'package:final_project/controller/profile_admin_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/resource/definition_style.dart';
import 'package:final_project/ui/profile/profile_admin/constains.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:final_project/widget/in_put/edit_info_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class EditInfoEmployee extends StatelessWidget {
  var controller = Get.find<EditInfoEmployeeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Stack(children: [
                        controller.assets.isEmpty
                            ? Container(
                                child: CircleImage(
                                  widthImg: 150,
                                  heightImg: 150,
                                  urlImg:
                                     controller.employeeData.employeeData.get('avatar') ,
                                  borderRadius: 100,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                  image: AssetEntityImageProvider(
                                      controller.assets.first),
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                              onTap: () => controller.selectAssets(context),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    boxShadow: [greyBoxShadow],
                                    border:
                                        Border.all(width: 1, color: greyBackground),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: greyTextColor,
                                ),
                              )),
                        )
                      ])
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    controller: controller.nameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    controller: controller.emailController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    controller: controller.phoneController,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    controller: controller.ageController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                  onTap: ()=> controller.setEmployeeData(),
                  child: Container(
                    height: kSpacingUnit.w * 4,
                    width: kSpacingUnit.w * 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'Chỉnh sửa thông tin',
                        style: kButtonTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: ()=> controller.delete(),
                  child: Container(
                    height: kSpacingUnit.w * 4,
                    width: kSpacingUnit.w * 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'Xoá nhân viên',
                        style: kButtonTextStyle,
                      ),
                    ),
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
