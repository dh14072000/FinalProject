import 'package:final_project/model/time_keeping_model.dart';
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/resource/definition_style.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class TimeKeepingCarrd extends StatelessWidget {
  final TimeKeepingModel timeKeeping;
  final String? status;
  final RxString? urlImg;

  const TimeKeepingCarrd(
      {super.key, required this.timeKeeping, this.status, this.urlImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: greyBorder,
          borderRadius: BorderRadius.circular(10)),
      height: 80,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Obx(
          () => CircleImage(
            widthImg: 50,
            heightImg: 50,
            urlImg: urlImg!.value ??
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fsearch%3Fq%3Davatar&psig=AOvVaw1TmNhAHoyuVRL348oy0Q27&ust=1682501381731000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLizhp3cxP4CFQAAAAAdAAAAABAE',
            borderRadius: 100,
          ),
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
