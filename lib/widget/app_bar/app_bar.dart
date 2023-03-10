
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProjectAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProjectAppBar(
      {Key? key, this.text, this.image, required this.height, this.backButton})
      : super(key: key);
  final Image? image;
  final String? text;
  final double height;
  final backButton;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: backButton ? BackButton(color: Colors.black) : Container(),
      backgroundColor: Colors.transparent,
      elevation: 10,
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
        child: Container(
          alignment: Alignment.center,
          child: image ??
              Text(
                text!,
                style: AppFonts.textRedButton,
              ),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
