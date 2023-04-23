import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.name, required this.phone});
  final String name;
  final String phone;

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
      child: Row(
         children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset('images/image_default.jpg'),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.textContent,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                phone,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.textfield,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
