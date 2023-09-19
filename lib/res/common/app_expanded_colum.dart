import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_container.dart';

import '../constant/app_colors.dart';
import 'media_query.dart';

class AppExpandedColumn extends StatelessWidget {
  final String? image;
  final void Function()? onTap;
  final String? text;
  const AppExpandedColumn({super.key, this.image, this.text, this.onTap});

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
                color: AppColors.lightBlack,
                fontSize: height(context) / 55,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
