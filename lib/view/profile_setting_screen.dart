import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medocly/res/constant/app_images.dart';
import 'package:medocly/utils/routes/routes_name.dart';

import '../res/common/media_query.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';

class ProfileAndSettingScreen extends StatefulWidget {
  const ProfileAndSettingScreen({super.key});

  @override
  State<ProfileAndSettingScreen> createState() =>
      _ProfileAndSettingScreenState();
}

class _ProfileAndSettingScreenState extends State<ProfileAndSettingScreen> {
  List<String> data = [
    "Edit Profile",
    "Help Center",
    "Invite Friends",
    "Terms and Conditions",
    'Privacy Policy',
    "About Us",
    "LogOut"
  ];
  final ImagePicker picker = ImagePicker(); //instance of class
  XFile? galleryImage;
  File? pickImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.titleOfProfile,
          style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width(context) / 30),
            child: Image.asset(
              AppImages.circle,
              height: height(context) / 30,
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.skuBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height(context) / 50),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: height(context) / 8,
                            width: width(context) / 3.5,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: pickImage != null
                                ? ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(
                                        width(context) / 1),
                                    child: Image.file(pickImage!,
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover),
                                  )
                                : Image.asset(
                                    AppImages.profileImage,
                                    height: height(context) / 8,
                                  ),
                          ),
                          InkWell(
                            onTap: () async {
                              galleryImage = await picker.pickImage(
                                source: ImageSource.gallery,
                                maxHeight: 200,
                                maxWidth: 200,
                                imageQuality: 100,
                              );
                              debugPrint(
                                  "Pick image -------->> ${galleryImage!.path}");
                              debugPrint(
                                  "Pick image name -------->> ${galleryImage!.name}");
                              pickImage = File(galleryImage!.path);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      width(context) / 45)),
                              child: Padding(
                                padding: EdgeInsets.all(width(context) / 140),
                                child: const Icon(
                                  Icons.edit,
                                  color: AppColors.skuBlue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        AppString.andrewAinsley,
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      const Text(
                        AppString.mobileNumber,
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: width(context) / 30,
              vertical: height(context) / 40,
            ),
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: index == 6 ? AppColors.orange : AppColors.black,
                    fontSize: 16,
                  ),
                ),
                index == 6
                    ? const SizedBox()
                    : IconButton(
                        onPressed: index == 0
                            ? () => Navigator.pushNamed(
                                context, RoutesName.editProfileScreen)
                            : () {},
                        icon: const Icon(Icons.navigate_next_rounded),
                      ),
              ],
            ),
            itemCount: data.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
