import 'package:final_project/controller/bonus_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/text/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class BonusPage extends StatelessWidget {
  dynamic argument = Get.arguments;
        var controller = Get.find<BonusController>();


  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (_, height, width, sy, sx) {
      return Scaffold(
        appBar: ProjectAppBar(
          height: sy(50),
          backButton: true,
          text: '${argument.get('name')}',
          aligement: Alignment.centerLeft,
        ),
        body: Column(children: [
          Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(sx(12))),
                        child: TabBar(
                          labelColor: whiteColor,
                          unselectedLabelColor: darkText,
                          isScrollable: false,
                          controller: controller.recommendationTab,
                          indicator: BoxDecoration(color: background),
                          tabs: [
                            Container(
                              child: SmallText(
                                text: 'Thưởng'.tr,
                              ),
                              padding: EdgeInsets.only(
                                  left: sx(30),
                                  bottom: sx(15),
                                  right: sx(30),
                                  top: sx(15)),
                            ),
                            Container(
                              child: SmallText(
                                text: 'Phụ cấp'.tr,
                              ),
                              padding: EdgeInsets.only(
                                  left: sx(30),
                                  bottom: sx(15),
                                  right: sx(30),
                                  top: sx(15)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 1,color: background,),
                    Expanded(
                      child: TabBarView(
                          controller: controller.recommendationTab,
                          children: [
                            Container(),
                            Container()
                          ]),
                    ),
        ]),
      );
    });
  }
}
