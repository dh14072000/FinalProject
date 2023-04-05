import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';


class LoginController extends GetxController{
  double headerHeight = 250;
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();

  Future<bool> userExists(user, password) {
    return FirebaseFirestore.instance
        .collection('admin')
        .where('email', isEqualTo: user)
        .where('password',
            isEqualTo: sha512.convert(utf8.encode(password + user)).toString())
        .get()
        .then((value) => value.size > 0 ? true : false);
  }

  login() async {
    bool result = await userExists(
        userController.text.trim(), passwordController.text.trim());
    if (result == true) {
      Get.offAll(TabPage());
    } else {
      printError(info: 'error');
    }
  }
}