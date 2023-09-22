import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class AppRow extends StatelessWidget {
  final String? text;
  final String? time;
  final double? height;

  const AppRow({super.key, this.text, this.time, this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text ?? "",
          style: TextStyle(
              height: height ?? 3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.grey700),
        ),
        Text(
          time!,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.grey700),
        ),
      ],
    );
  }
}
