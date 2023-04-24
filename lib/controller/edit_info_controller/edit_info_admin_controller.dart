import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/fire_storage.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/widget/base/mixin_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInfoAdminController extends GetxController
    with UploadImage, FireStorage {
  var adminData = Get.find<LoginController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('admin').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('admin');

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

  @override
  void onInit() {
    super.onInit();
    companyController.text = adminData.admin.company;
    nameController.text = adminData.admin.name;
    emailController.text = adminData.admin.email;
    phoneController.text = adminData.admin.phone;
  }

  void setCompanyData() async {
    String? avatarRef;
    var str = await setAvatar();

    if (str != null) {
      avatarRef = await storageRef.child("avatar/$str").getDownloadURL();
    }

    ref.doc(adminData.admin.id).update({
      'avatar': avatarRef,
      'company': companyController.text,
      'name': nameController.text,
      'phone': phoneController.text,
    }).then((value) => Get.snackbar(
        'Thông tin tài khoản đã cập nhật!', 'Mời bạn đăng nhập lại để sử dụng',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green));
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(RoutePaths.LOGIN);
    });
  }

  void delete() {
    ref.doc(adminData.admin.id).delete();
  }
}
