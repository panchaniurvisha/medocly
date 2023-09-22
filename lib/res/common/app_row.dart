import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class AppRow extends StatelessWidget {
  final String? text;
  final String? time;
  final int index;

  const AppRow({super.key, this.text, this.time, required this.index});

  @override
  Widget build(BuildContext context) {
    final textHeight = index == 3 ? 0.0 : 3.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text ?? "",
          style: TextStyle(
              height: textHeight,
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
