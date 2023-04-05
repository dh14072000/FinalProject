import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/ui/login/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';


class RegisterAdminController extends GetxController{
final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  bool checkedValue = false;
  bool checkboxValue = false;

  CollectionReference admin = FirebaseFirestore.instance.collection('admin');

  register() async {
    await admin.add({
                                  'company': companyController.text.trim(),
                                  'name': nameController.text.trim(),
                                  'email': emailController.text.trim(),
                                  'phone': phoneController.text.trim(),
                                  'password': sha512
                                      .convert(utf8.encode(
                                          passwordController.text.trim() +
                                              emailController.text.trim()))
                                      .toString(),
                                }).then((value) => print('added'));
                                Get.to(() => LoginPage());
  }
}