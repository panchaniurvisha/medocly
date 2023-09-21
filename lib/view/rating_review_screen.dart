import 'package:flutter/material.dart';
import 'package:medocly/res/constant/app_colors.dart';
import 'package:medocly/res/constant/app_images.dart';
import 'package:medocly/res/constant/app_string.dart';

import '../res/common/app_review_button.dart';
import '../res/common/app_review_list_builder.dart';
import '../res/common/media_query.dart';

class RatingReviewScreen extends StatefulWidget {
  const RatingReviewScreen({
    super.key,
  });

  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
  final List<Map> fiveReviewData = [
    {
      "image": AppImages.reviewPerson,
      "number": "5",
      "name": AppString.charoletteHanlin,
      "review": AppString.otherPersonReview
    },
    {
      "image": AppImages.personFour,
      "number": "5",
      "name": AppString.aileenFullbright,
      "review": AppString.otherPersonReviewFour
    },
  ];
  final List<Map> fourReviewData = [
    {
      "image": AppImages.personTwo,
      "number": "4",
      "name": AppString.darronkulikowski,
      "review": AppString.otherPersonReviewTwo
    },
    {
      "image": AppImages.personThree,
      "number": "4",
      "name": AppString.lauraleeQuintero,
      "review": AppString.otherPersonReviewThree
    },
    {
      "image": AppImages.personFive,
      "number": "4",
      "name": AppString.rodolfoGoode,
      "review": AppString.otherPersonReviewFive
    },
  ];
  final List<Map> informationOfReview = [
    {
      "image": AppImages.reviewPerson,
      "number": "5",
      "name": AppString.charoletteHanlin,
      "review": AppString.otherPersonReview
    },
    {
      "image": AppImages.personTwo,
      "number": "4",
      "name": AppString.darronkulikowski,
      "review": AppString.otherPersonReviewTwo
    },
    {
      "image": AppImages.personThree,
      "number": "4",
      "name": AppString.lauraleeQuintero,
      "review": AppString.otherPersonReviewThree
    },
    {
      "image": AppImages.personFour,
      "number": "5",
      "name": AppString.aileenFullbright,
      "review": AppString.otherPersonReviewFour
    },
    {
      "image": AppImages.personFive,
      "number": "4",
      "name": AppString.rodolfoGoode,
      "review": AppString.otherPersonReviewFive
    },
  ];
  final List<String> data = ["All", "5", "4", "3", "2", "1"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.skuBlue,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            AppString.titleOfAppbar,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width(context) / 30,
                vertical: height(context) / 40),
            child: Column(
              children: [
                SizedBox(
                  height: height(context) / 22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final isSelect = index == selectedIndex;
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(
                            () {
                              selectedIndex = index;
                            },
                          );
                        },
                        child: AppReviewButton(
                          showIconAndSizedBox: true,
                          iconColor:
                              isSelect ? Colors.white : AppColors.skuBlue,
                          isSelected: true,
                          text: data[index],
                          containerColor:
                              isSelect ? AppColors.skuBlue : Colors.white,
                          textColor:
                              isSelect ? Colors.white : AppColors.skuBlue,
                        ),
                      );
                    },
                  ),
                ),
                buildSelectedWidget()!,
              ],
            ),
          ),
        ));
  }

  Widget? buildSelectedWidget() {
    switch (selectedIndex) {
      case 0:
        return ListView.builder(
          itemBuilder: (context, index) => AppReviewListViewBuilder(
            image: informationOfReview[index]["image"],
            name: informationOfReview[index]["name"],
            reviewButtonText: informationOfReview[index]["number"],
            review: informationOfReview[index]["review"],
          ),
          shrinkWrap: true,
          itemCount: informationOfReview.length,
        );

      case 1:
        return ListView.builder(
          itemBuilder: (context, index) => AppReviewListViewBuilder(
            image: fiveReviewData[index]["image"],
            name: fiveReviewData[index]["name"],
            reviewButtonText: fiveReviewData[index]["number"],
            review: fiveReviewData[index]["review"],
          ),
          shrinkWrap: true,
          itemCount: fiveReviewData.length,
        );
      case 2:
        return ListView.builder(
          itemBuilder: (context, index) => AppReviewListViewBuilder(
            image: fourReviewData[index]["image"],
            name: fourReviewData[index]["name"],
            reviewButtonText: fourReviewData[index]["number"],
            review: fourReviewData[index]["review"],
          ),
          shrinkWrap: true,
          itemCount: fourReviewData.length,
        );
    }
    return null;
  }
}
