import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/controller/home_controller.dart';
import 'package:final_project/controller/schadule_month_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/card/time_keeping_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatelessWidget {
  var controller = Get.find<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 5,
            child: Calendar(
              startOnMonday: true,
              weekDays: const ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
              events: controller.listEvent,
              onRangeSelected: (range) =>
                  print('Range is ${range.from}, ${range.to}'),
              onDateSelected: (date) async {
                await controller.handleNewDate(date);
                await controller.getTimeEmployeeData();
              },
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
            flex: 4,
            child: Obx(
              () => ListView.builder(
                itemCount: controller.timeData.length,
                itemBuilder: (context, index) => TimeKeepingCarrd(
                  timeKeeping: controller.timeData[index],
                  status: controller.statusDay(index),
                  urlImg: controller.timeData[index].avatar,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
