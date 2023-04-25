import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/controller/fire_storage.dart';
import 'package:final_project/widget/base/mixin_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInfoEmployeeController extends GetxController with UploadImage {
  var employeeData = Get.find<DetailEmployeeController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final fireStore =
      FirebaseFirestore.instance.collection('employees').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('employees');

  @override
  void onInit() {
    super.onInit();
    nameController.text = employeeData.employeeData.get('name');
    emailController.text = employeeData.employeeData.get('email');
    phoneController.text = employeeData.employeeData.get('phone');
    ageController.text = employeeData.employeeData.get('age');
  }

  void setEmployeeData() async {
    ref.doc(employeeData.employeeData.get('id')).update({
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'age': ageController.text,
    }).then((value) => Get.snackbar(
        'Thành công', 'Thông tin nhân viên đã cập nhật!',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green));
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(RoutePaths.HOME_PAGE);
    });
  }

  void delete() {
    ref.doc(employeeData.employeeData.get('id')).delete();
    Get.snackbar('Thành công', 'Nhân viên đã được xoá khỏi hệ thống!',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(RoutePaths.HOME_PAGE);
    });
  }
}
