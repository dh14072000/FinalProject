import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color? textColor;
  final TextAlign textAlign;
  final String text;
  final double fontSize;
  final TextStyle? style;
  final TextOverflow overFlow = TextOverflow.ellipsis;
  final double height;
  final FontWeight fontWeight;
  const SmallText(
      {Key? key,
      this.textColor,
      this.fontWeight = FontWeight.w500,
      required this.text,
      this.textAlign = TextAlign.left,
      this.fontSize = 0,
      this.height = 1.2, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
              color: textColor,
              overflow: overFlow,
              fontFamily: 'Roboto',
              fontSize: fontSize == 0 ? 16 : fontSize,
              height: height,
              fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }
}
