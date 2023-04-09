import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class RegisterEmployeeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
        var controller = Get.find<LoginController>();


  bool checkedValue = false;
  bool checkboxValue = false;

  CollectionReference employees =
      FirebaseFirestore.instance.collection('employees');

  addEmployee() async {
    await employees.add({
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'password': sha512
          .convert(utf8.encode(
              passwordController.text.trim() + emailController.text.trim()))
          .toString(),
      'age': ageController.text.trim(),
      'company':controller.admin.company
    }).then((value) => print('added'));
  }
}
