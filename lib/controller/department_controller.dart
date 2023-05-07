import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/fire_storage.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/model/admin_model.dart';
import 'package:final_project/widget/base/mixin_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class DepartmentController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController coefficientsController = TextEditingController();

  var conpany = Get.find<LoginController>();

  CollectionReference department =
      FirebaseFirestore.instance.collection('department');

  addDepartment() async {
    await department.add({
      'name': nameController.text.trim(),
      'coefficients': coefficientsController.text.trim(),
      'idCompany': conpany.admin.id,
      'id': '',
    }).then((value) {
      department.doc(value.id).update({'id': value.id});
      Get.snackbar('Thành công', 'Phòng ban đã được tạo thành công',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    });
    Timer(Duration(seconds: 2), () {
      Get.close(1);
    });
  }
}
