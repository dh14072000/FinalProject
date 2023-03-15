import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class TouchID extends StatefulWidget {
  final User user;
  final bool touchID;
  final String employeePassword;

  const TouchID(
      {super.key,
      required this.touchID,
      required this.employeePassword, required this.user});

  @override
  State<TouchID> createState() => _TouchIDState();
}

class _TouchIDState extends State<TouchID> {
  final LocalAuthentication auth = LocalAuthentication();
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    if (widget.touchID) {
      authenticate();
    }
  }

  void authenticate() async {
    List<BiometricType> availableBiomertrics =
        await auth.getAvailableBiometrics();
    if(Platform.isAndroid){
      if (availableBiomertrics.contains(BiometricType.fingerprint)) {
      final authentiacted = await auth.authenticate(
          localizedReason: 'Enable Touch ID to sign in more easily');

      if (authentiacted) {
        storage.write(key: 'email', value: widget.user.email);
        storage.write(key: 'password', value: widget.employeePassword);
        storage.write(key: 'touchID', value: 'true');
      }
    }
    }
     else {
      print('Can\'t check');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Text('Wellcome ${widget.user}'),
        ),
      ),
    );
  }
}
