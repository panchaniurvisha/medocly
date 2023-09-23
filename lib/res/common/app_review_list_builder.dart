import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_review_button.dart';

import '../constant/app_colors.dart';
import 'media_query.dart';

class AppReviewListViewBuilder extends StatelessWidget {
  final String? image;
  final String? name;
  final String? reviewButtonText;
  final String? review;

  const AppReviewListViewBuilder({
    super.key,
    this.image,
    this.name,
    this.reviewButtonText,
    this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height(context) / 40),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image!,
                height: height(context) / 15,
              ),
              const Spacer(),
              Text(
                name!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              AppReviewButton(
                showIconAndSizedBox: true,
                iconColor: AppColors.skuBlue,
                isSelected: true,
                text: reviewButtonText!,
                containerColor: Colors.white,
                textColor: AppColors.skuBlue,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: height(context) / 100,
            ),
            child: Text(review!,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
