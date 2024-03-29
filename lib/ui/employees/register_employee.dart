import 'dart:convert';
import 'package:final_project/controller/register_employee_controller.dart';
import 'package:final_project/model/admin_model.dart';
import 'package:final_project/model/department_model.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/resource/definition_style.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/ui/login/widget/header_widget.dart';
import 'package:final_project/widget/btn_component/btn_drop_down.dart';
import 'package:final_project/widget/btn_component/btn_radio.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class RegisterEmployeePage extends StatelessWidget {
  var controller = Get.find<RegisterEmployeeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 150,
              child: const HeaderWidget(
                  150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
                padding: EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: () {
                    controller.assets.isEmpty;
                    controller.nameController.text = '';
                    controller.emailController.text = '';
                    controller.phoneController.text = '';
                    controller.employeeCode.text = '';
                    controller.ageController.text = '';
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Obx(
                                () => controller.assets.isEmpty
                                    ? const CircleImage(
                                        widthImg: 150,
                                        heightImg: 150,
                                        urlImg:
                                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fsearch%3Fq%3Davatar&psig=AOvVaw1TmNhAHoyuVRL348oy0Q27&ust=1682501381731000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLizhp3cxP4CFQAAAAAdAAAAABAE',
                                        borderRadius: 100,
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image(
                                          image: AssetEntityImageProvider(
                                              controller.assets.first),
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
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
                                        border: Border.all(
                                            width: 1, color: greyBackground),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100))),
                                    child: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: greyTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.nameController,
                            decoration: ThemeHelper()
                                .textInputDecoration('Họ tên', 'Nhập họ tên'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Vui lòng nhập họ tên nhân viên";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.emailController,
                            decoration: ThemeHelper()
                                .textInputDecoration("Email", "Nhập email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              // ignore: prefer_is_not_empty
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val!)) {
                                return "Email sai định dạng";
                              }
                              if (val.isEmpty) {
                                return 'Vui lòng nhập email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Obx(
                          () => Dropdown<DepartmentModel>(
                            hint: 'Chọn Phòng ban',
                            listOption: controller.listDepartment.value,
                            onChange: (value) {
                              controller.selectedDepartment.value = value;
                            },
                            optionChildWidget: (c) => Text(c.name!),
                            val: controller.selectedDepartment.value,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Obx(
                          () => Column(
                            children: [
                              RadioGroupButton<Position>(
                                  title: "Quản lý".tr,
                                  value: Position.MANAGER,
                                  selectedValue:
                                      controller.selectedPosition.value,
                                  onChange: (val) {
                                    controller.selectedPosition.value = val!;
                                  }),
                              RadioGroupButton<Position>(
                                  title: "Nhân viên".tr,
                                  value: Position.EMPLOYEE,
                                  selectedValue:
                                      controller.selectedPosition.value,
                                  onChange: (val) {
                                    controller.selectedPosition.value = val!;
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.phoneController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Số điện thoại", "Nhập số điện thoại"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              // ignore: prefer_is_not_empty
                              if (!RegExp(r"^(\d+)*$").hasMatch(val!)) {
                                return "Số điện thoại sai định dạng";
                              }
                              if (val.isEmpty) {
                                return 'Vui lòng nhập số điện thoại';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.employeeCode,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mã nhân viên", "Nhập mã nhân viên"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "vui lòng nhập mã nhân viên";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.ageController,
                            keyboardType: TextInputType.number,
                            decoration: ThemeHelper()
                                .textInputDecoration("Tuổi", "Nhập tuổi"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Vui lòng nhập tuổi";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Tạo nhân viên".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                Utils.onloading(
                                    context, controller.addEmployee());
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
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
