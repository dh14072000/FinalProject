import 'dart:convert';

import 'package:final_project/controller/home_controller.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/ui/login/forgot_password.dart';
import 'package:final_project/ui/login/register_admin.dart';
import 'package:final_project/ui/login/widget/header_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class LoginPage extends StatelessWidget {
  var controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: controller.headerHeight,
              child: HeaderWidget(
                  controller.headerHeight,
                  true,
                  Icons
                      .fingerprint_outlined), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Signin into your account',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.userController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Tài khoản', 'Nhập tài khoản'),
                                validator: (value){
                                  if (value!.isEmpty &&
                                  RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(value)) {
                                return "Nhập sai định dạng Email";
                              }else if (value.isEmpty) {
                                return "Vui lòng nhập email";
                              }
                              return null;
                                },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                'Mật khẩu',
                                'Nhập mật khẩu',
                                // IconButton(
                                //     onPressed: () {},
                                //     icon: const Icon(
                                //         Icons.fingerprint_outlined))
                                        ),
                                        validator: (value){
                                          if (value!.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
                              }
                              return null;
                                        } ,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Đăng nhập'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                controller.userExists(
                                    controller.userController.text,
                                    controller.passwordController.text);

                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text.rich(TextSpan(children: [
                            const TextSpan(text: "Chưa có tài khoản? "),
                            TextSpan(
                              text: 'Đăng ký',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(RegisterAdmin());
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ])),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
