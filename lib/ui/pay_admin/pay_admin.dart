import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/controller/pay_admin_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/profile/profile_admin/profile_list-item.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/text/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:relative_scale/relative_scale.dart';

class PayAdminPage extends StatelessWidget {
  var controller = Get.find<PayAdminController>();
  var detailEmployee = Get.find<DetailEmployeeController>();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
          appBar: ProjectAppBar(
            height: sy(50),
            text: 'Thanh toán tháng ${DateTime.now().month}',
            backButton: true,
          ),
          body: Column(
            children: [
              controller.controller.listSarlay != []?ListView.builder(
                shrinkWrap: true,
                itemCount: controller.controller.listSarlay.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: greyBorder,
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.payment_outlined,
                          size: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: SmallText(
                            text: controller.controller.listSarlay[index]
                                .toString(),
                            style: TextStyle(color: primaryColor, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ): SizedBox.shrink(),
              SizedBox(
                height: (30),
              ),
              ProfileListItem(
                onTap: () async {
                   Get.close(3);
                },
                icon: LineAwesomeIcons.paypal_credit_card,
                text: 'OK',
                hasNavigation: false,
              ),
            ],
          ));
    });
  }
}
