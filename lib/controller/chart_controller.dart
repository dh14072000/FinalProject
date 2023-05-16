import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:get/get.dart';

import '../resource/utils/utils.dart';

class ChartController extends GetxController {
  List<TimeKeepingModel> dataTimer = [];
  RxList listTimeDu = [].obs;
  RxList listTimeMu = [].obs;
  RxList listTimeNu = [].obs;
  RxList listTimeVa = [].obs;

  getSarlayMonth(int id) async {
    dataTimer.clear();

    final snapShort = await FirebaseFirestore.instance
        .collection('timeData')
        .where('id', isEqualTo: id)
        .get();
    if (snapShort.docs.isNotEmpty) {
      dataTimer =
          snapShort.docs.map((e) => TimeKeepingModel.formSnapShort(e)).toList();
    }
    dataTimer.forEach((e) {
      if (e.timeIn != null &&
          e.timeIn!.isNotEmpty &&
          e.timeOut != null &&
          e.timeOut!.isNotEmpty) {
        var status = Utils.checkTimeKeeping(e.date!, e.timeIn!, e.timeOut!);
        if (status == 'DU') {
          listTimeDu.add(e);
        } else if (status == 'MU') {
          listTimeMu.add(e);
        } else if (status == 'NU') {
          listTimeNu.add(e);
        }
        listTimeVa.add(e);
      }
    });
  }
}
