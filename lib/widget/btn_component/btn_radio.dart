
import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:flutter/material.dart';

class RadioGroupButton<T> extends StatelessWidget {
  const RadioGroupButton({
    Key? key,
    required this.title,
    required this.value,
    required this.onChange,
    required this.selectedValue,
  }) : super(key: key);

  final String title;
  final T value;
  final void Function(T? val) onChange;
  final T selectedValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      title: Text(
        title,
        style: AppFonts.textDialog,
      ),
      leading: Radio<T>(
        activeColor: primaryColor,
        value: value,
        groupValue: selectedValue,
        onChanged: onChange,
      ),
    );
  }
}