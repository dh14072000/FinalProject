import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/image/image_text_delegate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' as future;

class ProfileAdminController extends GetxController {
  // get asset
  RxList<AssetEntity> assets = <AssetEntity>[].obs;

  Future<void> selectAssets(BuildContext context) async {
    try {
      final List<AssetEntity>? result = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
            maxAssets: 1,
            selectedAssets: assets,
            requestType: RequestType.image,
            textDelegate: const CustomAssetsPickerTextDelegate(),
            themeColor: background),
      );
      if (result != null) {
        assets.value = result;
        print(result);
      }
    } catch (e) {
      print(e);
    }
  }

// logout
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(RoutePaths.LOGIN);
  }

  //export data form csv file
  void exportData() async {
    try {
      final CollectionReference timeKeeping =
          FirebaseFirestore.instance.collection('timeData');
      final timeData = await rootBundle.loadString('images/dataproject.csv');
      List<List<dynamic>> csvTable =
          const CsvToListConverter().convert(timeData);
      List<List<dynamic>> data = [];
      data = csvTable;
      for (var i = 0; i < data.length; i++) {
        var record = {
          'day': data[i][0],
          'id': data[i][1],
          'name': data[i][2],
          'timeIn': data[i][3],
          'timeOut': data[i][4],
        };
        timeKeeping.add(record);
      }
      Get.snackbar('Thành công', 'Tải dữ liệu thành công',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Không thành công', 'Vui lòng kiểm tra lại kết nối của bạn',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
