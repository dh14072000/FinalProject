import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/image/image_text_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ProfileAdminController extends GetxController {
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
      if (result != null) assets.value = result;
    } catch (e) {
      print(e);
    }
  }
}
