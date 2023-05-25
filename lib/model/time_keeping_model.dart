import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class TimeKeepingModel {
  final String? date;
  final int? id;
  final String? name;
  final String? timeIn;
  final String? timeOut;
  late RxString? avatar;

  TimeKeepingModel( {
    this.date,
    this.id,
    this.name,
    this.timeIn,
    this.timeOut,
    this.avatar,
  });

  toJson() {
    return {
      "day": date,
      "id": id,
      "name": name,
      "timeIn": timeIn,
      "timeOut": timeOut,
      "avatar": avatar,
    };
  }

  factory TimeKeepingModel.formSnapShort(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TimeKeepingModel(
        date: data['day'],
        id: data['id'] == 'Mã NV' ? -1 : data['id'],
        name: data['name'],
        timeIn: data['timeIn'],
        avatar: RxString(data['avatar'] ?? ''),
        timeOut: data['timeOut']);
  }

  @override
  String toString() {
    return 'date: $date , id : $id , name : $name, timeIn : $timeIn, timeOut : $timeOut , avatar : $avatar';
  }
}
