import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import 'media_query.dart';

class AppContainer extends StatelessWidget {
  final String? image;
  const AppContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) / 12,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.lightBlue, shape: BoxShape.circle),
      child: Padding(
        padding: EdgeInsets.all(height(context) / 40),
        child: Image.asset(image!),
      ),
    );
  }
}
