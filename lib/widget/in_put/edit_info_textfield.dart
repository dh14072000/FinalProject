import 'package:final_project/resource/definition_color.dart';
import 'package:final_project/widget/base/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField(
      {Key? key,
      this.formKey,
      this.validator,
      this.onChange,
      this.controller,
      this.onTap,
      this.readOnly = false,
      this.hint,
      this.isObscureText = false,
      this.maxLength})
      : super(key: key);
  final Key? formKey;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool readOnly;
  final String? hint;
  final bool isObscureText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        onTap: onTap,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        validator: validator,
        style: AppFonts.textGreyNotification,
        readOnly: readOnly,
        onChanged: onChange,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        decoration: InputDecoration(
          fillColor: greyBorder,
          filled: true,
          hintText: hint,
          errorMaxLines: 2,
          hintStyle: AppFonts.textHint,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: greyTextColor),
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: EdgeInsets.only(left: 20)
        ),
      ),
    );
  }
}
