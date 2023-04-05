import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/ui/home/home_page.dart';
import 'package:final_project/ui/home/register_employee/register_page.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/ui/login/forgot_password.dart';
import 'package:final_project/ui/login/register_admin.dart';
import 'package:final_project/ui/login/widget/header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class LoginPage extends StatelessWidget {
  var controller = Get.find<LoginController>();
  // double _headerHeight = 250;
  // final _formKey = GlobalKey<FormState>();

  // TextEditingController passwordController = TextEditingController();
  // TextEditingController userController = TextEditingController();

  // Future<bool> userExists(user, password) {
  //   return FirebaseFirestore.instance
  //       .collection('admin')
  //       .where('email', isEqualTo: user)
  //       .where('password',
  //           isEqualTo: sha512.convert(utf8.encode(password + user)).toString())
  //       .get()
  //       .then((value) => value.size > 0 ? true : false);
  // }

  // login() async {
  //   bool result = await userExists(
  //       userController.text.trim(), passwordController.text.trim());
  //   if (result == true) {
  //     Get.offAll(TabPage());
  //   } else {
  //     printError(info: 'error');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   userController.text = 'peter@gmail.com';
  //   passwordController.text = 'peter@123456';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: controller.headerHeight,
              child: HeaderWidget(
                  controller.headerHeight,
                  true,
                  Icons
                      .fingerprint_outlined), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Signin into your account',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.userController,
                            decoration: ThemeHelper().textInputDecoration(
                                'User Name', 'Enter your user name'),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                'Password',
                                'Enter your password',
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.fingerprint_outlined))),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage()),
                              );
                            },
                            child: const Text(
                              "Forgot your password?",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Sign In'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          // child: Text('Don\'t have an account? Create'),
                          child: Text.rich(TextSpan(children: [
                            const TextSpan(text: "Don\'t have an account? "),
                            TextSpan(
                              text: 'Create',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(RegisterAdmin());
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ])),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
