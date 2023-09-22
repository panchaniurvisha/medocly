import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_elevated_button.dart';
import 'package:medocly/res/common/app_row.dart';

import '../res/common/media_query.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class ReviewSummeryScreen extends StatefulWidget {
  const ReviewSummeryScreen({super.key});

  @override
  State<ReviewSummeryScreen> createState() => _ReviewSummeryScreenState();
}

class _ReviewSummeryScreenState extends State<ReviewSummeryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skuBlue,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          AppString.reviewSummery,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) / 30, vertical: height(context) / 40),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(AppImages.drJennyWaston,
                    height: height(context) / 8),
                SizedBox(width: width(context) / 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppString.drJennyWatson,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: height(context) / 40,
                        child: const Divider(
                          color: AppColors.dividerColor,
                          height: 0,
                          thickness: 1,
                        ),
                      ),
                      const Text(
                        AppString.immunologists,
                        style: TextStyle(
                            height: 2,
                            color: AppColors.lightBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        AppString.placeHospital,
                        style: TextStyle(
                            color: AppColors.lightBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height(context) / 20),
            const AppRow(
              text: AppString.dateAndHour,
              time: AppString.eventTime,
            ),
            const AppRow(
              text: AppString.clinicName,
              time: AppString.nameOfClinic,
            ),
            const AppRow(
              text: AppString.address,
              time: AppString.addressOfJaipur,
            ),
            const AppRow(height: 0, time: AppString.rajsthan),
            SizedBox(height: height(context) / 20),
            const AppRow(
              text: AppString.bookingAmount,
              time: AppString.rs200,
            ),
            const AppRow(
              text: AppString.convenienceCharges,
              time: AppString.rs5,
            ),
            SizedBox(height: height(context) / 40),
            const AppRow(
              text: AppString.total,
              time: AppString.rs205,
            ),
            const Spacer(),
            const AppElevatedButton(text: AppString.next)
          ],
        ),
      ),
    );
  }
}
