import 'package:final_project/widget/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class EmployeeDetail extends StatelessWidget {
  EmployeeDetail({super.key});
  dynamic argument = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: ProjectAppBar(
          height: sy(50),
          backButton: true,
          text: '${argument.get('name')}',
          aligement: Alignment.centerLeft,
          action: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.phone)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.message)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
            
          ],
        ),
        body: Column(
          children: [
            Container(),
            Container(),
            Container()
          ],
        ),
      );
    });
  }
}
