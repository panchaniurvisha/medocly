import 'package:flutter/material.dart';
import 'package:medocly/res/common/app_elevated_button.dart';
import 'package:medocly/res/common/app_textfield.dart';
import 'package:medocly/res/common/media_query.dart';

import '../../res/constant/app_colors.dart';
import '../../res/constant/app_images.dart';
import '../../res/constant/app_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Text(
          AppString.createNewAccount,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) / 30),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(
                  AppImages.profileImage,
                  height: height(context) / 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width(context) / 45)),
                  child: Padding(
                    padding: EdgeInsets.all(height(context) / 200),
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.skuBlue,
                    ),
                  ),
                ),
              ],
            ),
            AppTextField(
              hintText: AppString.fullName,
              controller: nameController,
            ),
            AppTextField(
              hintText: AppString.phoneNumber,
              controller: phoneNumberController,
            ),
            AppTextField(
              hintText: AppString.hintOfBirthDate,
              controller: birthDateController,
            ),
            AppTextField(
              hintText: AppString.hintOfEmail,
              controller: emailController,
            ),
            AppElevatedButton(
              text: AppString.continueButton,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
