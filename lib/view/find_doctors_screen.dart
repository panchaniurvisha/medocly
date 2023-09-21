import 'package:flutter/material.dart';
import 'package:medocly/res/common/media_query.dart';
import 'package:medocly/res/constant/app_string.dart';

import '../res/common/app_expanded_colum.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';

class FindDoctorsScreen extends StatefulWidget {
  const FindDoctorsScreen({super.key});

  @override
  State<FindDoctorsScreen> createState() => _FindDoctorsScreenState();
}

class _FindDoctorsScreenState extends State<FindDoctorsScreen> {
  List<Map> data = [
    {
      "image": AppImages.user,
      "text": AppString.general,
    },
    {
      "image": AppImages.dentist,
      "text": AppString.dentist,
    },
    {
      "image": AppImages.ophThaL,
      "text": AppString.ophthalmic,
    },
    {
      "image": AppImages.nutrition,
      "text": AppString.nutrition,
    },
    {
      "image": AppImages.neurologist,
      "text": AppString.neUroLo,
    },
    {
      "image": AppImages.pediatric,
      "text": AppString.pediatric,
    },
    {
      "image": AppImages.radioLogistic,
      "text": AppString.raDioLo,
    },
    {
      "image": AppImages.moreCircle,
      "text": AppString.more,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skuBlue,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          AppString.titleOfAppBar,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: height(context) / 40),
        itemCount: 3,
        itemBuilder: (context, index) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 5, childAspectRatio: 0.8),
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = data[index];
            return Row(
              children: [
                AppExpandedColumn(
                  image: item["image"],
                  text: item["text"],
                  showTitle: false,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
