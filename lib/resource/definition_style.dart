import 'package:final_project/resource/definition_color.dart';
import 'package:flutter/material.dart';

final BoxShadow greyBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 1,
  blurRadius: 5,
  offset: Offset(0, 6),
);

final BoxShadow sectionBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 1,
  blurRadius: 5,
  offset: Offset(4, 0),
);

final OutlineInputBorder whiteFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  borderSide: BorderSide(color: Colors.white),
);

final OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  borderSide: BorderSide(color: greyBackground),
);

final BoxDecoration borderTopRedBackground = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  ),
);

final BoxDecoration borderAllRed = BoxDecoration(
  border: Border.all(color: darkText),
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);
final BoxDecoration borderAll = BoxDecoration(
  border: Border.all(color: greyBorder),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);