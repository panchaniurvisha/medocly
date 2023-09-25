import 'package:flutter/material.dart';
import 'package:medocly/res/common/media_query.dart';

import '../constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.maxLength,
    this.suffixIcon,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller!,
      maxLines: maxLength ?? 1,
      autofocus: false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon ?? const SizedBox(),
        contentPadding: EdgeInsets.symmetric(
            vertical: height(context) / 55, horizontal: width(context) / 20),
        counter: const SizedBox(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            width(context) / 22.5,
          ),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width(context) / 22.5),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        fillColor: AppColors.textFieldFilledColor,
        hintText: hintText!,
        hintStyle: const TextStyle(
            color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w600),
        labelText: labelText ?? "",
        labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.labelTextColor),
      ),
    );
  }
}
