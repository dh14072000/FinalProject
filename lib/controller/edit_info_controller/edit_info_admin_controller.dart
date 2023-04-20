import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInfoAdminController extends GetxController {
  var adminData = Get.find<LoginController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('admin').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('admin');

  @override
  void onInit() {
    super.onInit();
    companyController.text = adminData.admin.company;
    nameController.text = adminData.admin.name;
    emailController.text = adminData.admin.email;
    phoneController.text = adminData.admin.phone;
  }

  void setCompanyData() async {
    ref.doc(adminData.admin.id).update({
      'company': companyController.text,
      'name': nameController.text,
      'phone': phoneController.text,
    }).then((value) => Get.snackbar(
        'Thông tin tài khoản đã cập nhật!', 'Mời bạn đăng nhập lại để sử dụng',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green));
    Timer(Duration(seconds: 2), () {
      Get.offAllNamed(RoutePaths.LOGIN);
    });
  }

  void delete() {
    ref.doc(adminData.admin.id).delete();
  }
}
