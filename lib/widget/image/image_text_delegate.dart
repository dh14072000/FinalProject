import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class CustomCameraPickerTextDelegate extends CameraPickerTextDelegate {
  const CustomCameraPickerTextDelegate();

  @override
  String get languageCode => 'Picker_locale'.tr;

  @override
  String get confirm => 'Picker_confirm'.tr;

  @override
  String get shootingTips => 'Picker_shoot_tip'.tr;

  @override
  String get loadFailed => 'Picker_load_failed'.tr;

  @override
  String get loading => 'Picker_loading'.tr;

  @override
  String get saving => 'Picker_saving'.tr;

  @override
  String get sActionPreviewHint => 'Picker_preview'.tr;

  @override
  String get sActionShootHint => 'Picker_shoot_hint'.tr;

  @override
  String get sActionShootingButtonTooltip => 'Picker_shoot_button_hint'.tr;
}

class CustomAssetsPickerTextDelegate extends AssetPickerTextDelegate {
  const CustomAssetsPickerTextDelegate();

  @override
  String get languageCode => 'Picker_locale'.tr;

  @override
  String get confirm => 'Picker_confirm'.tr;

  @override
  String get cancel => 'Picker_cancel'.tr;

  @override
  String get edit => 'Picker_edit'.tr;

  @override
  String get loadFailed => 'Picker_load_failed'.tr;

  @override
  String get preview => 'Picker_preview'.tr;

  @override
  String get select => 'Picker_choose'.tr;

  @override
  String get emptyList => 'Picker_empty'.tr;

  @override
  String get unableToAccessAll => 'Picker_unable_to_access_all'.tr;

  @override
  String get viewingLimitedAssetsTip => "Picker_view_limit_tip".tr;

  @override
  String get changeAccessibleLimitedAssets => "Picker_update_access_assets".tr;

  @override
  String get accessAllTip => "Picker_access_all".tr;

  @override
  String get goToSystemSettings => 'Picker_goto_setting'.tr;

  @override
  String get accessLimitedAssets => 'Picker_limited_access'.tr;

  @override
  String get accessiblePathName => 'Picker_accessible_assets'.tr;

  @override
  String get sTypeImageLabel => 'Picker_image'.tr;

  @override
  String get sTypeOtherLabel => 'Picker_other'.tr;

  @override
  String get sActionPreviewHint => 'Picker_preview'.tr;

  @override
  String get sActionSelectHint => 'Picker_choose'.tr;

  @override
  String get sActionSwitchPathLabel => 'Picker_change_dir'.tr;

  @override
  String get sUnitAssetCountLabel => 'Picker_count'.tr;
}
