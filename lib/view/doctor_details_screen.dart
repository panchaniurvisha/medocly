import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_expanded_colum.dart';
import 'package:medocly/res/common/app_review_button.dart';
import 'package:medocly/res/constant/app_string.dart';
import 'package:medocly/utils/routes/routes_name.dart';

import '../res/common/media_query.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.skuBlue,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            AppString.drJennyWatson,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          actions: [
            Image.asset(
              AppImages.heart,
              height: height(context) / 30,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(context) / 30,
              vertical: height(context) / 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.mohanSharma,
                        height: height(context) / 8),
                    SizedBox(width: width(context) / 40),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.drMohanSharma,
                          style: TextStyle(
                              height: 3,
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          AppString.immunologists,
                          style: TextStyle(
                              height: 2,
                              color: AppColors.lightBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          AppString.placeHospital,
                          style: TextStyle(
                              height: 2,
                              color: AppColors.lightBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height(context) / 30),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppExpandedColumn(
                          image: AppImages.user3,
                          text: AppString.fiveThousand,
                          color: AppColors.skuBlue,
                          title: AppString.patients),
                      AppExpandedColumn(
                          image: AppImages.messenger,
                          text: AppString.tenPlus,
                          color: AppColors.skuBlue,
                          title: AppString.patients),
                      AppExpandedColumn(
                          image: AppImages.star,
                          text: AppString.rate,
                          color: AppColors.skuBlue,
                          title: AppString.patients),
                      AppExpandedColumn(
                          image: AppImages.chatIcon,
                          text: AppString.reviewValue,
                          color: AppColors.skuBlue,
                          title: AppString.patients),
                    ],
                  ),
                ),
                const Text(
                  AppString.aboutMe,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const Text(
                  AppString.doctorInformation,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightBlack),
                ),
                const Text(
                  AppString.workingTime,
                  style: TextStyle(
                      height: 2.5, fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const Text(
                  AppString.time,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightBlack),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height(context) / 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppString.reviews,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                          splashColor: Colors.transparent,
                          child: const Text(
                            AppString.seeAll,
                            style: TextStyle(
                                color: AppColors.skuBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          onTap: () => Navigator.pushNamed(
                              context, RoutesName.ratingReviewScreen)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImages.reviewPerson,
                      height: height(context) / 15,
                    ),
                    const Spacer(),
                    const Text(
                      AppString.charoletteHanlin,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    const AppReviewButton(
                      showIconAndSizedBox: true,
                      iconColor: AppColors.skuBlue,
                      isSelected: true,
                      text: AppString.five,
                      containerColor: Colors.white,
                      textColor: AppColors.skuBlue,
                    ),
                    const Spacer(),
                    Image.asset(AppImages.circle, height: height(context) / 30),
                  ],
                ),
                const Text(AppString.otherPersonReview,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                const Align(
                  alignment: Alignment.center,
                  child: Text(AppString.feesAmount,
                      style: TextStyle(
                          height: 3,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.skuBlue),
                        minimumSize: MaterialStateProperty.all(
                            Size(width(context) / 1.2, height(context) / 16))),
                    child: const Text(
                      AppString.bookAppointment,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
