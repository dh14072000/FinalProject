import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/controller/profile_admin_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/profile/edit_info/edit_info_admin.dart';
import 'package:final_project/ui/profile/profile_admin/constains.dart';
import 'package:final_project/ui/profile/profile_admin/profile_list-item.dart';
import 'package:final_project/ui/profile/profile_admin/view_csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileAdminPage extends StatelessWidget {
  var detailController = Get.find<LoginController>();
  var controller = Get.find<ProfileAdminController>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('images/image_default.jpg')),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                    onTap: () => controller.selectAssets(context),
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(width: 1, color: greyBackground),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Icon(
                        Icons.edit,
                        size: 18,
                        color: greyTextColor,
                      ),
                    )),
              )
            ]),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            detailController.admin.company,
            style: kTitleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          SizedBox(height: kSpacingUnit.w * 2),
          GestureDetector(
            onTap: () => Get.toNamed(RoutePaths.EDIT_INFO_ADMIN),
            child: Container(
              height: kSpacingUnit.w * 4,
              width: kSpacingUnit.w * 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                color: Theme.of(context).accentColor,
              ),
              child: Center(
                child: Text(
                  'Chỉnh sửa thông tin',
                  style: kButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState: Theme.of(context).brightness == Brightness.dark
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        onTap: () => controller.exportData(),
                        icon: LineAwesomeIcons.fingerprint,
                        text: 'Tải file dữ liệu',
                      ),
                      ProfileListItem(
                        onTap: () => Get.to(() => const ViewCsvPage()),
                        icon: LineAwesomeIcons.calendar,
                        text: 'Báo cáo file(Excel)',
                      ),
                      ProfileListItem(
                        onTap: () {
                          controller.signOut();
                        },
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',
                        hasNavigation: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
