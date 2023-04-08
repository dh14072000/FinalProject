import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String company;
  final String name;
  final String email;
  final String phone;
  final String password;

  AdminModel(this.company, this.name, this.email, this.phone, this.password);

  toJson() {
    return {
      "company": company,
      "name": name,
      "email": email,
      "phone": phone,
      "password": sha512.convert(utf8.encode(email + password)).toString(),
    };
  }

  factory AdminModel.formSnapShort(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return AdminModel(data!['company'], data['name'], data['email'], data['phone'], data['password']);
  }
}
