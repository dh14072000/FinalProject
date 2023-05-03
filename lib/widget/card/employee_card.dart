import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.name, required this.phone, this.urlImage, });
  final String name;
  final String phone;
  final String? urlImage;

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
        
        CircleImage(
          widthImg: 50,
          heightImg: 50,
          urlImg: urlImage ?? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fsearch%3Fq%3Davatar&psig=AOvVaw1TmNhAHoyuVRL348oy0Q27&ust=1682501381731000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLizhp3cxP4CFQAAAAAdAAAAABAE' ,
          borderRadius: 100,
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
