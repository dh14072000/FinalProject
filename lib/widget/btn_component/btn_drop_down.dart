import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/text/small_text.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

typedef OnChangeCallBack<T> = void Function(T?);
typedef OptionWidget<T> = Widget Function(T);

class Dropdown<T> extends StatelessWidget {
  const Dropdown({
    Key? key,
    required this.onChange,
    this.height,
    this.label,
    this.hint,
    this.errorMessage,
    this.backgroundColor = Colors.white,
    required this.val,
    required this.listOption,
    required this.optionChildWidget,
    this.borderColor,
    this.iconBackground,
    this.contentPadding,
    this.labelStyle,
    this.sufixText,
    this.isExpanded,
  }) : super(key: key);

  final OnChangeCallBack<T> onChange;
  final double? height;
  final T? val;
  final List<T> listOption;
  final OptionWidget<T> optionChildWidget;
  final String? hint;
  final Color backgroundColor;
  final String? label;
  final String? errorMessage;
  final Color? borderColor;
  final Color? iconBackground;
  final EdgeInsets? contentPadding;
  final TextStyle? labelStyle;
  final String? sufixText;
  final bool? isExpanded;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (c, _, w, sy, sx) => Row(
        children: [
          label != null
              ? Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(right: sx(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SmallText(
                            text: label!,
                            style: labelStyle ?? AppFonts.textGreyNotification,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: errorMessage != null ? sx(25) : 0,
                          child: SizedBox.shrink(),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
          Expanded(
            flex: 7,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: height ?? sy(27),
                clipBehavior: Clip.antiAlias,
                padding: contentPadding ?? EdgeInsets.only(left: sx(15)),
                decoration: ShapeDecoration(
                  color: backgroundColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: errorMessage != null
                            ? primaryColor
                            : borderColor ?? greyBorder),
                    borderRadius: BorderRadius.all(Radius.circular(sx(5))),
                  ),
                ),
                child: DropdownButton<T>(
                  isExpanded: true,
                  elevation: 16,
                  icon: Container(
                    decoration: BoxDecoration(
                      color: iconBackground ?? greyBackground,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(sx(10)),
                          bottomRight: Radius.circular(sx(10))),
                    ),
                    height: height ?? sy(27),
                    width: height ?? sy(27),
                    child: Icon(
                      Icons.arrow_drop_down_sharp,
                      size: sy(20),
                      color: greyTextColor,
                    ),
                  ),
                  value: val,
                  hint: hint != null
                      ? Text(
                          hint!,
                          style: AppFonts.textHint,
                        )
                      : null,
                  style: AppFonts.textfield,
                  onChanged: onChange,
                  items: listOption.isEmpty
                      ? []
                      : listOption
                          .map<DropdownMenuItem<T>>((value) => DropdownMenuItem(
                                value: value,
                                child: optionChildWidget(value),
                              ))
                          .toList(),
                  underline: DropdownButtonHideUnderline(child: Container()),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: errorMessage != null ? sx(25) : 0,
                padding: EdgeInsets.only(left: sx(15), top: sx(5)),
                child: errorMessage != null
                    ? SmallText(
                        text: errorMessage!,
                        textColor: primaryColor,
                        textAlign: TextAlign.left,
                        fontSize: sx(14),
                      )
                    : SizedBox.shrink(),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
