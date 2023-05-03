import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/controller/fire_storage.dart';
import 'package:final_project/widget/base/mixin_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInfoEmployeeController extends GetxController with UploadImage,FireStorage {
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

    Future<String?> setAvatar() async {
    String? fileName;
    List<File?> file =
        await Future.wait(assets.value.map((e) => e.file).toList());
    if (file.single == null) return null;

    var filePath = file.single!.path;
    fileName = filePath.split("/").last;

    await uploadImage(file.single!, fileName);

    return fileName;
  }

  void setEmployeeData() async {
          String? avatarRef;
    var str = await setAvatar();
    if (str != null) {
      avatarRef = await storageRef.child("avatar/$str").getDownloadURL();
    }

    ref.doc(employeeData.employeeData.get('id')).update({
      'avatar': avatarRef,
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'age': ageController.text,
    }).then((value) => Get.snackbar(
        'Thành công', 'Thông tin nhân viên đã cập nhật!',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green));
    Timer(const Duration(seconds: 2), () {
      Get.close(2);
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
