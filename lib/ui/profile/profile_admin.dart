import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:final_project/controller/login_controller.dart';
import 'package:final_project/controller/profile_admin_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/profile/profile_admin/constains.dart';
import 'package:final_project/ui/profile/profile_admin/profile_list-item.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ProfileAdminPage extends StatelessWidget {
  var detailController = Get.find<LoginController>();
    var controller = Get.find<ProfileAdminController>();


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Obx(() => Container(
            // height: kSpacingUnit.w * 10,
            // width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(children: [
                        controller.assets.isEmpty
                            ? Container(
                                child: CircleImage(
                                  widthImg: 100,
                                  heightImg: 100,
                                  urlImg:
                                      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fpcf.gallery%2Fassets%2Fimages%2Furlimagecontrol.jpg&tbnid=kveoWEoZJdFUZM&vet=12ahUKEwjo2PnHrKf-AhVosVYBHc8pACYQMygAegQIARBE..i&imgrefurl=https%3A%2F%2Fpcf.gallery%2Furl-image-control%2F&docid=Ug_ggqWfq3K9YM&w=659&h=696&q=urlImage&ved=2ahUKEwjo2PnHrKf-AhVosVYBHc8pACYQMygAegQIARBE',
                                  borderRadius: 100,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                  image: AssetEntityImageProvider(
                                      controller.assets.first),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                              onTap: () =>
                                  controller.selectAssets(context),
                              child: Container(
                                width: 25,
                                height:25,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    // boxShadow: [greyBoxShadow],
                                    border: Border.all(
                                        width: 1, color: greyBackground),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: greyTextColor,
                                ),
                              )),
                        )
                      ]),
          ),),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            detailController.admin.company,
            style: kTitleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
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
        ],
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState: Theme.of(context).brightness == Brightness.dark ?
          CrossFadeState.showFirst: CrossFadeState.showSecond,
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
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
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
                      // ProfileListItem(
                      //   icon: LineAwesomeIcons.user_shield,
                      //   text: 'Privacy',
                      // ),
                      ProfileListItem(
                        onTap: () {},
                        icon: LineAwesomeIcons.fingerprint,
                        text: 'Update dữ liêu',
                      ),
                      ProfileListItem(
                        onTap: (){},
                        icon: LineAwesomeIcons.calendar,
                        text: 'Báo cáo file(Excel)',
                      ),
                      // ProfileListItem(
                      //   icon: LineAwesomeIcons.cog,
                      //   text: 'Settings',
                      // ),
                      // ProfileListItem(
                      //   icon: LineAwesomeIcons.user_plus,
                      //   text: 'Invite a Friend',
                      // ),
                      ProfileListItem(
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
