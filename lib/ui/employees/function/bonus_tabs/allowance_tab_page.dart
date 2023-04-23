import 'package:final_project/controller/bonus_tabs_controller/allowance_tabs_page.dart';
import 'package:final_project/controller/bonus_tabs_controller/bonus_tabs_controller.dart';
import 'package:final_project/controller/reduce_controller.dart';
import 'package:final_project/model/reduce_model.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/ui/login/common/theme_helper.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/in_put/label_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:intl/intl.dart';

class AllowanceTabPage extends StatelessWidget {
  var controller = Get.find<AllowanceController>();

  final String id;

   AllowanceTabPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (_, height, width, sy, sx) {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              LabelTextFormField(
                textController: controller.appointmentDateText,
                label: 'Ngày'.tr,
                textHint: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                readOnly: true,
                marginBottom: sy(10),
                listIcon: [
                  TextFieldIcon(
                      Icon(
                        Icons.calendar_month,
                        size: sy(17),
                      ), () async {
                    var datePicker = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime(DateTime.now().year),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: true,
                    );
                    if (datePicker != null) {
                      controller.appointmentDate = datePicker;
                      controller.appointmentDateText.text =
                          DateFormat('dd/MM/yyyy').format(datePicker);
                    }
                  })
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              LabelTextFormField(
                textController: controller.allowanceController,
                textHint: 'Số tiền',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              LabelTextFormField(
                textController: controller.noteController,
                textHint: 'Ghi chú(vd:vượt chỉ tiêu,hoa hồng)',
              ),
              Container(
                margin: EdgeInsets.only(top: sy(50)),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(colors: [
                      Color(0xFF26CBE6),
                      Color(0xFF26CBC0),
                    ], begin: Alignment.topCenter, end: Alignment.center)),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: whiteColor,
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                      Text(
                        'Thêm phụ cấp'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    var allowance = ReduceModel(
                        id: id,
                        cash: controller.allowanceController.text,
                        date: controller.appointmentDateText.text,
                        note: controller.noteController.text);
                    controller.onAllowance(allowance);
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
