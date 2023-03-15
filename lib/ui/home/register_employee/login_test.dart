import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/ui/home/home_page.dart';
import 'package:final_project/ui/home/register_employee/register_page.dart';
import 'package:final_project/ui/home/register_employee/touchID.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/ui/login/forgot_password.dart';
import 'package:final_project/ui/login/widget/header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'package:local_auth/local_auth.dart';

class LoginTest extends StatefulWidget {
  const LoginTest({Key? key}) : super(key: key);

  @override
  _LoginTestState createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final LocalAuthentication auth = LocalAuthentication();

  bool userTouchID = false;
  void signIn({required String em, required String pw}) {
    _auth.signInWithEmailAndPassword(email: em, password: pw).then(
        (authResult) => Get.to(() => TouchID(
            user: authResult.user!,
            touchID: userTouchID,
            employeePassword: passwordController.text)));
  }

  @override
  void innitState() {
    super.initState();
    getSecureStorage();
  }

  void getSecureStorage() async {
    final isUsingBio = await storage.read(key: 'usingBiometric');
    setState(() {
      userTouchID = isUsingBio == 'true';
    });
  }

  void authenticate() async {
    List<BiometricType> availableBiomertrics =
        await auth.getAvailableBiometrics();
      final authentiacted = await auth.authenticate(
          localizedReason: 'Enable Touch ID to sign in more easily');

      if (!authentiacted) {
        storage.read(key: 'email');
        storage.read(key: 'password');
        signIn(em: userController.text, pw: passwordController.text);
      }
    } 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight,
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
                    key: _formKey,
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
                            controller: userController,
                            decoration: ThemeHelper().textInputDecoration(
                                'User Name', 'Enter your user name'),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                              'Password',
                              'Enter your password',
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        GestureDetector(
                          child: IconButton(
                              onPressed: () => authenticate(),
                              icon: const Icon(Icons.fingerprint_outlined)),
                        ),
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
                              if (_formKey.currentState!.validate()) {}
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
                                  Get.to(RegisterEmployeePage());
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
