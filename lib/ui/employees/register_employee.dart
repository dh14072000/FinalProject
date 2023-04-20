import 'dart:convert';
import 'package:final_project/controller/register_employee_controller.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/ui/login/widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

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
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
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
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Email", "Nhập email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              // ignore: prefer_is_not_empty
                              if ((val!.isEmpty) &&
                                  RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Email sai định dạng";
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
                            controller: controller.employeeCode,
                            obscureText: true,
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
                            decoration: ThemeHelper()
                                .textInputDecoration("Tuổi", "Nhập tuổi"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Vui lòng nhập";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        // FormField<bool>(
                        //   builder: (state) {
                        //     return Column(
                        //       children: <Widget>[
                        //         Row(
                        //           children: <Widget>[
                        //             Checkbox(
                        //                 value: controller.checkboxValue,
                        //                 onChanged: (value) {
                        //                   controller.checkboxValue = value!;
                        //                   state.didChange(value);
                        //                 }),
                        //             const Text(
                        //               "I accept all terms and conditions.",
                        //               style: TextStyle(color: Colors.grey),
                        //             ),
                        //           ],
                        //         ),
                        //         Container(
                        //           alignment: Alignment.centerLeft,
                        //           child: Text(
                        //             state.errorText ?? '',
                        //             textAlign: TextAlign.left,
                        //             style: TextStyle(
                        //               color: Theme.of(context).errorColor,
                        //               fontSize: 12,
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     );
                        //   },
                        //   validator: (value) {
                        //     if (!controller.checkboxValue) {
                        //       return 'You need to accept terms and conditions';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
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
                                controller.addEmployee();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        // const Text(
                        //   "Or create account using social media",
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                        // const SizedBox(height: 25.0),
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
