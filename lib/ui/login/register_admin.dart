import 'dart:convert';

import 'package:final_project/controller/register_admin_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/resource/definition_style.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/ui/login/widget/header_widget.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class RegisterAdmin extends StatelessWidget {
  var controller = Get.find<RegisterAdminController>();

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
                              controller.assets.isEmpty
                                  ? Container(
                                      child: CircleImage(
                                        widthImg: 150,
                                        heightImg: 150,
                                        urlImg:
                                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fsearch%3Fq%3Davatar&psig=AOvVaw1TmNhAHoyuVRL348oy0Q27&ust=1682501381731000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLizhp3cxP4CFQAAAAAdAAAAABAE',
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
                            controller: controller.companyController,
                            decoration: ThemeHelper()
                                .textInputDecoration('Công ty', 'Nhập công ty'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.nameController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Quản lý', 'Nhập tên quản lý'),
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
                              if ((val!.isEmpty) &&
                                  RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Nhập sai định dạng Email";
                              }
                              return null;
                            },
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
                              if ((val!.isEmpty) &&
                                  RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Số điện thoại sai định dạng";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mật khẩu", "Nhập mật khẩu"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
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
                                "Đăng ký".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                controller.register();
                              }
                            },
                          ),
                        ),
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
