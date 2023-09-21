import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_container.dart';

import '../constant/app_colors.dart';
import 'media_query.dart';

class AppExpandedColumn extends StatelessWidget {
  final String? image;
  final void Function()? onTap;
  final String? text;
  final String? title;
  final Color? color;
  final bool showTitle;

  const AppExpandedColumn({
    super.key,
    this.image,
    this.text,
    this.onTap,
    this.title,
    this.color,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: onTap ?? () {},
            child: AppContainer(
              image: image!,
            ),
          ),
          SizedBox(height: height(context) / 60),
          Text(
            text!,
            style: TextStyle(
                color: color ?? AppColors.lightBlack,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          if (showTitle)
            Text(
              title!,
              style: const TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
        ],
      ),
    );
  }
}
