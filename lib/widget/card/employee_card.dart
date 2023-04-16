import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.name, required this.salary});
  final String name;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: greyBorder,
          borderRadius: BorderRadius.circular(10)),
      height: 80,
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$name',overflow: TextOverflow.ellipsis,style: AppFonts.textHeadline,),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Số dư',
                style: AppFonts.textHint,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$salary',
                style: TextStyle(
                    color: inProgressTextColor, fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ]),
    );
  }
}
