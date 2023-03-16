import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class Pay extends StatelessWidget {
  Pay({super.key});
  dynamic argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (_, height, width, sy, sx) {
      return Scaffold(
        appBar: ProjectAppBar(
          height: sy(50),
          backButton: true,
          text: '${argument.get('name')}',
          aligement: Alignment.centerLeft,
        ),
        body: Container(),
      );
    });
  }
}
