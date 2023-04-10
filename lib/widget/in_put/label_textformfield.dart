import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:final_project/widget/text/small_text.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

typedef String? ValidateFunction(String? val);

class TextFieldIcon {
  final Widget icon;
  final VoidCallback onTap;

  TextFieldIcon(this.icon, this.onTap);
}

class LabelTextFormField extends StatelessWidget {
  LabelTextFormField({
    Key? key,
    this.textController,
    this.textHint,
    this.label,
    this.onChanged,
    this.readOnly = false,
    this.validate,
    this.listIcon,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textFieldBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Color(0xFFF2F2F2)),
    ),
  }) : super(key: key);

  final TextEditingController? textController;
  final String? label;
  final String? textHint;
  final bool readOnly;
  final ValidateFunction? validate;
  final maxLines;
  final List<TextFieldIcon>? listIcon;
  final double marginTop, marginBottom;
  final OutlineInputBorder textFieldBorder;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (c, _, __, sy, sx) => Column(
        children: [
          SizedBox(
            height: marginTop,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label != null
                  ? Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(top: maxLines > 1 ? 0 : sy(8)),
                        child: SmallText(
                          text: label!,
                          style: AppFonts.textGreyNotification,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Stack(children: [
                      TextFormField(
                        readOnly: readOnly,
                        controller: textController,
                        validator: validate,
                        keyboardType: keyboardType,
                        onChanged: onChanged,
                        maxLines: maxLines,
                        style: TextStyle(color: greyTextColor),
                        decoration: InputDecoration(
                          
                            hintText: textHint,
                            errorStyle: TextStyle(fontSize: sx(14)),
                            hintStyle: AppFonts.textHint,
                            disabledBorder: InputBorder.none,
                            focusedBorder: textFieldBorder,
                            border: textFieldBorder,
                            enabledBorder: textFieldBorder,
                            fillColor: colorFormTextFied,
                            filled: true,
                            isDense: true,
                            contentPadding: EdgeInsets.only(
                                top: sy(7),
                                bottom: sy(7),
                                left: sx(15),
                                right: 0)),
                      ),
                      listIcon != null
                          ? Positioned(
                              right: sy(0),
                              bottom: sy(5),
                              child: Container(
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      listIcon!.length,
                                      (index) => Padding(
                                        padding: EdgeInsets.only(right: sx(10)),
                                        child: GestureDetector(
                                            onTap: listIcon![index].onTap,
                                            child: listIcon![index].icon),
                                      ),
                                    )),
                              ),
                            )
                          : SizedBox.shrink()
                    ]),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: marginBottom,
          ),
        ],
      ),
    );
  }
}
