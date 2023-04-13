import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReduceModel {

  final String? email;
  final String? date;
  final String? cash;
  final String? note;

  ReduceModel({this.cash,  this.email, this.date,  this.note,} 
      );

  toJson() {
    return {
      "email": email,
      "date": date,
      "cash": cash,
      "note": note,
    };
  }

  factory ReduceModel.formSnapShort(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ReduceModel(
        email: data['email'],
        date: data['date'],
        cash: data['cash'],
        note: data['note'],
    );
  }
}
