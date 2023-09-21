import 'package:flutter/material.dart';
import 'package:medocly/res/constant/app_colors.dart';

import 'media_query.dart';

class AppReviewButton extends StatelessWidget {
  final String? text;
  final Color? containerColor;
  final Color? iconColor;
  final Color? textColor;
  final bool isSelected;
  final bool showIconAndSizedBox;
  const AppReviewButton({
    super.key,
    this.text,
    required this.isSelected,
    this.containerColor,
    this.textColor,
    this.showIconAndSizedBox = true,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: height(context) / 60),
      decoration: BoxDecoration(
        color: containerColor!, //isSelected ? AppColors.skuBlue : Colors.white,
        border: Border.all(
          width: 2,
          color: AppColors.skuBlue,
        ),
        borderRadius: BorderRadius.circular(width(context) / 16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) / 25, vertical: height(context) / 200),
        child: Row(
          children: [
            if (showIconAndSizedBox)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: iconColor!,
                  ), //isSelected ? Colors.white : AppColors.skuBlue),
                  SizedBox(width: width(context) / 15),
                ],
              ),
            Text(
              text!,
              style: TextStyle(
                  color:
                      textColor!, //isSelected ? Colors.white : AppColors.skuBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
