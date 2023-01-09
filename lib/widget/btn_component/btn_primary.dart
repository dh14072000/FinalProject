
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final Color borderColor;
  final double width;
  final bool hasShadow;
  final String? title;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final Widget? prefixIcon;
  final style;
  final Widget? renderLabel;

  PrimaryButton(
      {Key? key,
      required this.onPressed,
      this.hasShadow = true,
      this.backgroundColor = Colors.white,
      this.borderRadius = 10,
      this.borderColor = Colors.transparent,
      this.width = 0,
      this.prefixIcon,
      this.margin = const EdgeInsets.all(15),
      this.padding,
      this.title,
      this.style,
       this.renderLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor),
              elevation: MaterialStateProperty.all<double>(hasShadow ? 5.0 : 0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius == 10
                          ? 10
                          : borderRadius),
                      side: BorderSide(width: 2, color: borderColor)))),
          child: Container(
            // width: width == 0 ? Dimensions.primaryBtnWidth : width,
            padding: padding == null
                ? const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  )
                : padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixIcon != null
                    ? Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: prefixIcon)
                    : const SizedBox.shrink(),
                renderLabel!,
              ],
            ),
          )),
    );
  }
}
