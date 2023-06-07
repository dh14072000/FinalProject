import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/model/admin_model.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/btn_component/btn_primary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';


class LoginController extends GetxController {
  late final FirebaseAuth _auth;
  double headerHeight = 250;
  final formKey = GlobalKey<FormState>();
  late AdminModel admin;
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  
  late BuildContext context;
  @override
  void onInit() {
    super.onInit();
    userController.text = 'peter@gmail.com';
    passwordController.text = 'peter@123456';
  }

  Future userExists(user, password) {
    getDetailAdmin();
    return FirebaseFirestore.instance
        .collection('admin')
        .where('email', isEqualTo: user)
        .where('password',
            isEqualTo: sha512.convert(utf8.encode(password + user)).toString())
        .get()
        .then((value) => value.size > 0
            ? Get.toNamed(RoutePaths.HOME_PAGE)
            : Get.defaultDialog(title: 'Đăng nhập thất bại!',
            middleText: 'Vui lòng kiểm tra lại thông tin tài khoản mật khẩu.',
            titleStyle: AppFonts.textRedButton,
            middleTextStyle: AppFonts.textGreyNotification,
            cancel: GestureDetector(
              onTap: ()=>Get.back(),
              child: Text('OK',style: AppFonts.red16Green,),
            )
            ));
  }

  getDetailAdmin() async {
    final snapShort = await FirebaseFirestore.instance
        .collection('admin')
        .where('email', isEqualTo: userController.text)
        .get();
    admin = snapShort.docs.map((e) => AdminModel.formSnapShort(e)).single;
  }
}
