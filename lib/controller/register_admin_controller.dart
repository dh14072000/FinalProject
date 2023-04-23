import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/model/admin_model.dart';
import 'package:final_project/ui/login/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class RegisterAdminController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  Rxn<String> userID = Rxn();

  bool checkedValue = false;
  bool checkboxValue = false;

  CollectionReference admin = FirebaseFirestore.instance.collection('admin');

  register() async {
    await admin.add({
      'company': companyController.text.trim(),
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'id':userID.value,
      'password': sha512
          .convert(utf8.encode(
              passwordController.text.trim() + emailController.text.trim()))
          .toString(),
    }).then((value) {
      admin.doc(value.id).update({'id': value.id});
      Get.snackbar('Thành công', 'Tài khoản của bạn đã được tạo thành công',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green);
    });
    Timer(Duration(seconds: 2), () {
      Get.offAllNamed(RoutePaths.LOGIN);
    });
  }
}
