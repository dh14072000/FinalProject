import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayAdminController extends GetxController {
 double sarlayPersonal = Get.arguments;
List<double> sarlaylist=[];
double total = 0.0;
   @override
  onInit() async {
    super.onInit();
    print(sarlayPersonal.toString());
    await countsarlay();
    print(total.toString());
  
  }

    Future<void> addToSP(List<double> tList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(sarlayPersonal.toString(), jsonEncode(tList));
  }

  countsarlay()  async {
   sarlaylist.add(sarlayPersonal);
    for(var e in sarlaylist){
      total = total + e;
    }
    print(sarlaylist.toString());
}}