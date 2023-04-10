import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReduceModel {

  final String? email;
  final String? dateReduce;
  final String? cashReduce;
  final String? note;

  ReduceModel({this.cashReduce,  this.email, this.dateReduce,  this.note,} 
      );

  toJson() {
    return {
      "email": email,
      "dateReduce": dateReduce,
      "cashReduce": cashReduce,
      "note": note,
    };
  }

  factory ReduceModel.formSnapShort(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ReduceModel(
        email: data['email'],
        dateReduce: data['dateReduce'],
        cashReduce: data['cashReduce'],
        note: data['note'],
    );
  }
}
