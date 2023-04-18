import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/resource/definition_style.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class TimeKeepingCarrd extends StatelessWidget {
  final TimeKeepingModel timeKeeping;
  final String? status;

  const TimeKeepingCarrd({super.key, required this.timeKeeping, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: greyBorder,
          borderRadius: BorderRadius.circular(10)),
      height: 80,
      padding: const EdgeInsets.only(top:15, bottom: 15,left: 30,right: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset('images/image_default.jpg'),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timeKeeping.name!,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.textHeadline,
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: borderAllRed,
          child: Center(child: Text(status!, style: AppFonts.textDark16)),
        )
      ]),
    );
  }
}
