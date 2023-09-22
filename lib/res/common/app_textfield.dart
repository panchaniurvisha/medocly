import 'package:flutter/material.dart';
import 'package:medocly/res/common/media_query.dart';

import '../constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final String? hintText;
  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller!,
      maxLines: maxLength ?? 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: height(context) / 55, horizontal: width(context) / 20),
        counter: const SizedBox(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              width(context) / 22.5,
            ),
            borderSide: const BorderSide(color: Colors.white, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width(context) / 22.5),
            borderSide: const BorderSide(color: Colors.blue, width: 2)),
        fillColor: AppColors.textFieldFilledColor,
        hintText: hintText!,
        hintStyle: const TextStyle(
            color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
