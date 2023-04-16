import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimeKeepingModel {
  final String? date;
  final int? id;
  final String? name;
  final String? timeIn;
  final String? timeOut;

  TimeKeepingModel({
    required this.date,
    required this.id,
    required this.name,
    required this.timeIn,
    required this.timeOut,
  });

  toJson() {
    return {
      "day": date,
      "id": id,
      "name": name,
      "timeIn": timeIn,
      "timeOut": timeOut,
    };
  }

  factory TimeKeepingModel.formSnapShort(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TimeKeepingModel(
        date: data['day'],
        id: data['id'],
        name: data['name'],
        timeIn: data['timeIn'],
        timeOut: data['timeOut']);
  }

  @override
  String toString() {
    return 'date: $date , id : $id , name : $name, timeIn : $timeIn, timeOut : $timeOut';
  }

}
