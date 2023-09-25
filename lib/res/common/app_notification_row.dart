import 'package:flutter/material.dart';
import 'package:medocly/res/common/media_query.dart';

import '../constant/app_colors.dart';

class AppNotificationRow extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;

  const AppNotificationRow({super.key, this.image, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) / 40),
      child: Row(
        children: [
          InkWell(
            child: Image.asset(image!, height: height(context) / 16),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width(context) / 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.black),
                ),
                Text(
                  subTitle!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.grey700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
