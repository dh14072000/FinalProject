import 'package:final_project/controller/detail_employee_controller.dart';
import 'package:final_project/controller/home_controller.dart';
import 'package:final_project/controller/schadule_month_controller.dart';
import 'package:final_project/controller/timekeeping_controller.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';

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
              margin: EdgeInsets.all(20),
              height: 100,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 2.0,
                    offset: Offset(0.0, 2.0))
              ]),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
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
