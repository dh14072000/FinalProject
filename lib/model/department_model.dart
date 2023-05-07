import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentModel {
  final String? name;
  final String? id;
  final String? coefficients;

  DepartmentModel({
    this.coefficients,
    this.id,
    this.name,
  });

  toJson() {
    return {
      "coefficients": coefficients,
      "id": id,
      "name": name,
    };
  }

  factory DepartmentModel.formSnapShort(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return DepartmentModel(
      id: data['id'],
      name: data['name'],
      coefficients: data['coefficients'],
    );
  }

  @override
  String toString() {
    return ' id : $id , name : $name, coefficients : $coefficients';
  }
}
