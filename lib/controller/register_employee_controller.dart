import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class RegisterEmployeeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController employeeCode = TextEditingController();

        var controller = Get.find<LoginController>();
  Rxn<String> idEmployee = Rxn();

  bool checkedValue = false;
  bool checkboxValue = false;

  CollectionReference employees =
      FirebaseFirestore.instance.collection('employees');

  addEmployee() async {
    await employees.add({
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'employeeCode':employeeCode.text.trim(),
      'id': idEmployee.value,
      'age': ageController.text.trim(),
      'idCompany':controller.admin.id
    }).then((value) {
      idEmployee.value = value.id;
      Get.snackbar('Thành công', 'Nhân viên đã được tạo thành công',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green);} );
    Timer(Duration(seconds: 2), () {
      Get.offAllNamed(RoutePaths.HOME_PAGE);
    });
  }
}
