import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import 'media_query.dart';

class AppDropDownButton extends StatelessWidget {
  final Object? value;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  const AppDropDownButton({super.key, this.value, this.onChanged, this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) / 1,
      padding: EdgeInsets.only(
        left: width(context) / 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width(context) / 22.5),
        border: Border.all(color: Colors.white, width: 2), // Border color
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: false,
          value: value!,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          iconSize: height(context) / 25,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
