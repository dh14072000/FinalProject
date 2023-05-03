import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/fire_storage.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/widget/base/mixin_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class RegisterEmployeeController extends GetxController with UploadImage, FireStorage {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController employeeCode = TextEditingController();

  var controller = Get.find<LoginController>();
  bool checkedValue = false;
  bool checkboxValue = false;
  CollectionReference employees =
      FirebaseFirestore.instance.collection('employees');

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


  addEmployee() async {
              String? avatarRef;
    var str = await setAvatar();

    if (str != null) {
      avatarRef = await storageRef.child("avatar/$str").getDownloadURL();
    }

    await employees.add({
      'avatar': avatarRef,
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'employeeCode': employeeCode.text.trim(),
      'id':employeeCode.text.trim(),
      'age': ageController.text.trim(),
      'idCompany': controller.admin.id
    }).then((value) {
      employees.doc(value.id).update({'id': value.id});
      Get.snackbar('Thành công', 'Nhân viên đã được tạo thành công',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    });
    Timer(Duration(seconds: 2), () {
      Get.offNamed(RoutePaths.HOME_PAGE);
    });
  }
}
