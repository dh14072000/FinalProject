import 'package:cloud_firestore/cloud_firestore.dart';

class TimeKeepingModel {
  final String? date;
  final int? id;
  final String? name;
  final String? timeIn;
  final String? timeOut;

  TimeKeepingModel({
    this.date,
    this.id,
    this.name,
    this.timeIn,
    this.timeOut,
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
        date: data['id'] == 'Mã NV' ? "04/22/2023" : data['day'],
        id: data['id'] == 'Mã NV' ? -1 : data['id'],
        name: data['name'],
        timeIn: data['timeIn'],
        timeOut: data['timeOut']);
  }

  @override
  String toString() {
    return 'date: $date , id : $id , name : $name, timeIn : $timeIn, timeOut : $timeOut';
  }
}
