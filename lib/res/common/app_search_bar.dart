import 'package:flutter/material.dart';
import 'package:medocly/res/constant/app_string.dart';

import '../constant/app_colors.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  const AppSearchBar({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height / 40),
      child: TextField(
        autofocus: false,
        // enabled: true,
        //readOnly: true,
        style: const TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontStyle: FontStyle.normal,
        ),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: height / 60),
            prefixIcon: const Icon(Icons.search_rounded, color: AppColors.grey),
            counter: Container(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: width / 40, color: AppColors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(width / 35),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: height / 350, color: AppColors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(width / 35),
              ),
            ),
            hintText: AppString.search,
            hintStyle: const TextStyle(
                // fontFamily: AppString.appFontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey),
            filled: true,
            fillColor: AppColors.white),
      ),
    );
  }
}
