import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:final_project/controller/reduce_controller.dart';
import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:final_project/widget/in_put/label_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:intl/intl.dart';

class ReducePage extends StatelessWidget {
  var controller = Get.find<ReduceController>();

  dynamic argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Future<List<DateTime?>?> datepicker() async {
      List<DateTime?>? datePicker = await showCalendarDatePicker2Dialog(
        context: context,
        config: CalendarDatePicker2WithActionButtonsConfig(),
        dialogSize: const Size(325, 400),
        value: controller.date,
        borderRadius: BorderRadius.circular(15),
      );
      return datePicker;
    }

    return RelativeBuilder(builder: (_, height, width, sy, sx) {
      return Scaffold(
        appBar: ProjectAppBar(
          height: sy(50),
          backButton: true,
          text: '${argument.get('name')}',
          aligement: Alignment.centerLeft,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
                Obx(
                () => LabelTextFormField(
                  textController: controller.appointmentDateText,
                  label: 'Ngày'.tr,
                  textHint:  DateFormat('dd/MM/yyyy').format(DateTime.now())  ,
                  readOnly: true,
                  marginBottom: sy(10),
                  listIcon: [
                    TextFieldIcon(
                        Icon(
                          Icons.calendar_month,
                          size: sy(17),
                        ), () async {
                      
                        
                    })
                  ],
                ),
              )  ,
              SizedBox(
                height: 20,
              ),
              LabelTextFormField(
                textController: controller.reduceController,
                textHint: 'Số tiền',
              ),
              SizedBox(
                height: 20,
              ),
              LabelTextFormField(
                textController: controller.reduceController,
                textHint: 'Ghi chú(vd:thuế,bảo hiểm)',
              )
            ],
          ),
        ),
      );
    });
  }
}
