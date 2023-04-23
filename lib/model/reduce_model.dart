import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReduceModel {

  final String? id;
  final String? date;
  final String? cash;
  final String? note;

  ReduceModel({this.cash,  this.id, this.date,  this.note,} 
      );

  toJson() {
    return {
      "id": id,
      "date": date,
      "cash": cash,
      "note": note,
    };
  }

  factory ReduceModel.formSnapShort(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ReduceModel(
        id: data['id'],
        date: data['date'],
        cash: data['cash'],
        note: data['note'],
    );
  }
   @override
  String toString() {
    return 'id: $id , date : $date , cash : $cash, note : $note';
  }
}
