import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/image/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProjectAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProjectAppBar(
      {Key? key,
      this.text,
      this.image,
      required this.height,
      required this.backButton,
      this.aligement,
      this.action,
      this.urlImage})
      : super(key: key);
  final Image? image;
  final String? text;
  final double height;
  final bool backButton;
  final Alignment? aligement;
  final List<Widget>? action;
  final String? urlImage;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: backButton
          ? BackButton(color: Colors.black)
          : Container(
              margin: EdgeInsets.all(5),
              child: Container(
                child: CircleImage(
                  widthImg: 50,
                  heightImg: 50,
                  urlImg: urlImage,
                  borderRadius: 100,
                ),
              ),
            ),
      backgroundColor: Colors.transparent,
      elevation: 10,
      actions: action,
      title: Text(
        text!,
        style: AppFonts.textContent,
      ),
      flexibleSpace: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child:
            Container(alignment: aligement ?? Alignment.center, child: image),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
