import 'package:final_project/controller/timekeeping_controller.dart';
import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/resource/definition_style.dart';
import 'package:final_project/resource/utils/utils.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeKeepingPage extends StatelessWidget {
  var controller = Get.find<TimeKeepingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: Calendar(
                startOnMonday: true,
                weekDays: const ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
                events: controller.listEvent,
                onRangeSelected: (range) =>
                    print('Range is ${range.from}, ${range.to}'),
                onDateSelected: (date) {
                  controller.handleNewDate(date);
                  controller.getTimeEmployeeData();
                },
                eventListBuilder: (context, events) => const SizedBox.shrink(),
                bottomBarColor: Colors.blue.shade300,
                isExpandable: true,
                eventDoneColor: Colors.green,
                bottomBarTextStyle: AppFonts.textContent,
                selectedColor: background,
                todayColor: Colors.blue,
                eventColor: Colors.red,
                locale: 'vi_VN',
                todayButtonText: 'Hà Nội',
                expandableDateFormat: 'EEEE, dd MMMM yyyy',
                dayOfWeekStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: Get.width,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              'Ngày ${DateFormat('MM/dd/yyyy').format(controller.selectedDay.value)}',
                              style: AppFonts.textContent,
                            ),
                          ),
                          Obx(() => Container(
                                height: 30,
                                width: 30,
                                decoration: borderAllRed,
                                child: Center(
                                    child: Text('${controller.statusDay()}',
                                        style: AppFonts.textDark16)),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  color: Colors.blue.shade300,
                                  child: Center(
                                      child: Text(
                                    'Giờ vào',
                                    style: AppFonts.textWhiteButton,
                                  )),
                                )),
                            Container(
                              width: 2,
                              color: whiteColor,
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  color: Colors.blue.shade300,
                                  child: Center(
                                      child: Text(
                                    'Giờ ra',
                                    style: AppFonts.textWhiteButton,
                                  )),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [greyBoxShadow],
                                    color: whiteColor,
                                  ),
                                  height: 80,
                                  child: Center(
                                      child: Obx(() => Text(
                                            controller.timeData.value.timeIn !=
                                                        null &&
                                                    controller.timeData.value
                                                        .timeIn!.isNotEmpty
                                                ? '${controller.timeData.value.timeIn}'
                                                : '00:00',
                                            style: AppFonts.textContent,
                                          ))),
                                )),
                            Container(
                              width: 2,
                              color: Colors.blue.shade300,
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [greyBoxShadow],
                                    color: whiteColor,
                                  ),
                                  height: 80,
                                  child: Center(
                                      child: Obx(() => Text(
                                            controller.timeData.value.timeOut !=
                                                        null &&
                                                    controller.timeData.value
                                                        .timeOut!.isNotEmpty
                                                ? '${controller.timeData.value.timeOut}'
                                                : '00:00',
                                            style: AppFonts.textContent,
                                          ))),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Obx(() => Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(children: [
                            Text(
                              'Thu nhập ngày : ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: darkText),
                            ),
                            Text('${controller.handleSarlay()} ',
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green)),
                            Text(
                              'VNĐ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: darkText),
                            ),
                          ]),
                        ))
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
