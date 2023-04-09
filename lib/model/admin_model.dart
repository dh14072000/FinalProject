import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String company;
  final String name;
  final String email;
  final String phone;
  final String password;

  AdminModel(
      {required this.company,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});

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
    final data = document.data()!;
    return AdminModel(
        company: data!['company'],
        name: data['name'],
        email: data['email'],
        phone: data['phone'],
        password: data['password']);
  }
}
