import 'package:flutter/material.dart';
import 'package:medocly/res/common/media_query.dart';
import 'package:medocly/res/constant/app_colors.dart';
import 'package:medocly/res/constant/app_images.dart';
import 'package:medocly/res/constant/app_string.dart';
import 'package:medocly/utils/routes/routes_name.dart';

class AppDentistDoctorList extends StatelessWidget {
  const AppDentistDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context) / 40),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.mohanSharma, height: height(context) / 8),
              SizedBox(height: height(context) / 60),
              const Text(
                AppString.consulTation,
                style: TextStyle(
                    color: AppColors.lightBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              const Text(
                AppString.rs500,
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width(context) / 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      AppString.drMohanSharma,
                      style: TextStyle(
                          height: 3,
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: width(context) / 10,
                    ),
                    Image.asset(
                      AppImages.heart,
                      color: AppColors.skuBlue,
                      height: height(context) / 40,
                    ),
                  ],
                ),
                const Text(
                  AppString.cardiologists,
                  style: TextStyle(
                      height: 2,
                      color: AppColors.lightBlack,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImages.star,
                      height: height(context) / 50,
                    ),
                    SizedBox(width: width(context) / 60),
                    const Text(
                      AppString.fourPointEight,
                      style: TextStyle(
                          height: 2,
                          color: AppColors.lightBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(AppImages.ticketStar,
                        height: height(context) / 50),
                    SizedBox(width: width(context) / 60),
                    const Text(
                      AppString.year,
                      style: TextStyle(
                          color: AppColors.lightBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: width(context) / 40),
                    Image.asset(AppImages.shieldDone,
                        height: height(context) / 50),
                    SizedBox(width: width(context) / 60),
                    const Text(
                      AppString.language,
                      style: TextStyle(
                          color: AppColors.lightBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: height(context) / 90,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, RoutesName.doctorDetailsScreen),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.skuBlue,
                    fixedSize: Size(width(context) / 1.7, height(context) / 20),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(width(context) / 10)),
                  ),
                  child: const Text(
                    AppString.bookVisit,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
