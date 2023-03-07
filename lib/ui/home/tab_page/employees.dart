import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/login/register_page.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/btn_component/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: ProjectAppBar(
          height: sy(50),
          text: 'GST-Global',
          backButton: false,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(sx(20)),
              height: sy(50),
              child: PrimaryButton(
                backgroundColor: blueColor,
                onPressed: () {
                  Get.to(RegistrationPage());
                },
                prefixIcon: Icon(
                  Icons.person_add,
                  color: whiteColor,
                ),
                renderLabel: Text(
                  'Thêm nhân viên',
                  style: AppFonts.textWhiteButton,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
