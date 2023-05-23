import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:final_project/widget/text/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    super.key,
    required this.name,
    required this.phone,
    this.urlImage,
    this.department, this.listDU, this.listMU, this.listNU, this.listVA,
  });
  final String name;
  final String phone;
  final String? urlImage;
  final String? department;
  final String? listDU;
  final String? listMU;
  final String? listNU;
  final String? listVA;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: greyBorder,
          borderRadius: BorderRadius.circular(10)),
      height: 100,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 10),
      child: Row(children: [
        CircleImage(
          widthImg: 50,
          heightImg: 50,
          urlImg: urlImage ??
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fsearch%3Fq%3Davatar&psig=AOvVaw1TmNhAHoyuVRL348oy0Q27&ust=1682501381731000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLizhp3cxP4CFQAAAAAdAAAAABAE',
          borderRadius: 100,
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.textContent,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                phone,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.textfield,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                department!,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.textfield,
              ),
            ],
          ),
        ),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SmallText(
                          text: 'DU: ',
                          textColor: Colors.green.shade400,
                        ),
                        SmallText(text: listDU!),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'MU: ',
                          textColor: Colors.grey.shade500,
                        ),
                        SmallText(text: listMU!),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SmallText(
                          text: 'NU: ',
                          textColor: Colors.brown.shade600,
                        ),
                        SmallText(text: listNU!),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'VA : ',
                          textColor: Colors.red.shade500,
                        ),
                        SmallText(text: listVA!),
                      ],
                    ),
                  ],
                )
              ],
            ))
      ]),
    );
  }
}
