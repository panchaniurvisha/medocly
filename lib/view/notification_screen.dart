import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_notification_row.dart';
import 'package:medocly/res/common/media_query.dart';

import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skuBlue,
        title: const Text(
          AppString.notifications,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) / 30),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNotificationRow(
              title: "Appointment Cancelled",
              subTitle: "Today | 15:36 PM",
              image: AppImages.closeIcon,
            ),
            Text(
              AppString.cancelText,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppNotificationRow(
              title: "Schedule Changed",
              subTitle: "Yesterday | 09:23 AM",
              image: AppImages.scheduleChangeIcon,
            ),
            Text(
              AppString.changedText,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppNotificationRow(
              title: "Appointment Success!",
              subTitle: "19 Dec, 2022 | 18:35 PM",
              image: AppImages.appointmentSuccessIcon,
            ),
            Text(
              AppString.appointmentSuccess,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppNotificationRow(
              title: "Account Setup Successful!",
              subTitle: "12 Dec, 2022 | 14:27 PM",
              image: AppImages.setupSuccessIcon,
            ),
            Text(
              AppString.setUpSuccess,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
