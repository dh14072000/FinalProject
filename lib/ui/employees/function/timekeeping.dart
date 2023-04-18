import 'package:final_project/controller/timekeeping_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/resource/definition_style.dart';
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
                weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
                events: controller.supportEvent.value,
                onRangeSelected: (range) =>
                    print('Range is ${range.from}, ${range.to}'),
                onDateSelected: (date) {
                  controller.handleNewDate(date);
                  controller.getTimeEmployeeData();
                },
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: background,
                todayColor: Colors.blue,
                eventColor: Colors.grey,
                locale: 'vi_VN',
                todayButtonText: 'Hà Nội',
                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
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
                      padding:  EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text('Ngày ' +
                              '${DateFormat('MM/dd/yyyy').format(controller.selectedDay.value)}',style: AppFonts.textContent,),),
                          Obx(() => Container(
                            height: 30,
                            width: 30,
                            decoration: borderAllRed,
                            child: Center(child: Text('${controller.statusDay()}',style:AppFonts.textDark16)),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
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
                                  color: blueColor,
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
                                  color: blueColor,
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
                                     child:  Obx(() => Text( controller.timeData.value.id != null ?
                                    '${controller.timeData.value.timeIn}' : '00:00',
                                    style: AppFonts.textContent,
                                  ))  ),
                                )),
                            Container(
                              width: 2,
                              color: whiteColor,
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
                                     child:  Obx(() => Text( controller.timeData.value.id != null ?
                                    '${controller.timeData.value.timeOut}' : '00:00',
                                    style: AppFonts.textContent,
                                  ))  ),
                                ))
                          ],
                        )
                      ],
                    )
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
