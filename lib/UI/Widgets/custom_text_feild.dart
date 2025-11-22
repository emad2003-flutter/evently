import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextFeild extends StatelessWidget {
  Color? borderColor;
  String? hintText;
  TextStyle? hintStyle;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? labelText;
  TextStyle? labelStyle;
  MyValidator validator;
  bool? obscureText;
  TextEditingController? controller;
  CustomTextFeild({
    this.obscureText,
    this.validator,
    this.borderColor,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.labelStyle,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: '*',
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      cursorColor: AppColors.primaryLight,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.bold14Grey,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.bold14Grey,
      ),
    );
  }
}
