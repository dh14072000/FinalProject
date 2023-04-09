import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
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
      this.action})
      : super(key: key);
  final Image? image;
  final String? text;
  final double height;
  final bool backButton;
  final Alignment? aligement;
  final List<Widget>? action;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: backButton ? BackButton(color: Colors.black) : Container(
        margin: EdgeInsets.all(5),
        child: const CircleAvatar(backgroundImage: NetworkImage(
'https://i.pinimg.com/564x/1e/7f/85/1e7f85e354e1a11b4a439ac9d9f7e283.jpg'),),
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
