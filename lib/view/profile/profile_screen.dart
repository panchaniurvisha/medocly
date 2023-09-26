import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../res/common/app_dropDownButton.dart';
import '../../res/common/app_elevated_button.dart';
import '../../res/common/app_textfield.dart';
import '../../res/common/media_query.dart';
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

  final ImagePicker picker = ImagePicker(); //instance of class
  XFile? galleryImage;
  File? pickImage;
  String? selectedValue = "Male";
  List<Map> dropDownListItemGender = [
    {
      "data": AppString.genderText,
      "value": "Gender",
    },
    {
      "data": AppString.male,
      "value": "Male",
    },
    {
      "data": AppString.female,
      "value": "Female",
    },
    {
      "data": AppString.others,
      "value": "Others",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.skuBlue,
        toolbarHeight: height(context) / 10,
        title: const Text(
          AppString.createNewAccount,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) / 30, vertical: height(context) / 40),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: height(context) / 8,
                  width: width(context) / 3.5,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: pickImage != null
                      ? ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius:
                              BorderRadius.circular(width(context) / 1),
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
                    debugPrint("Pick image -------->> ${galleryImage!.path}");
                    debugPrint(
                        "Pick image name -------->> ${galleryImage!.name}");
                    pickImage = File(galleryImage!.path);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(width(context) / 45)),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: height(context) / 40),
              child: AppTextField(
                hintText: AppString.hintOfFullName,
                controller: nameController,
              ),
            ),
            AppTextField(
              hintText: AppString.hintPhoneNumber,
              controller: phoneNumberController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height(context) / 40),
              child: AppTextField(
                hintText: AppString.hintOfBirthDate,
                controller: birthDateController,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(height(context) / 50),
                  child: Image.asset(
                    AppImages.calenderIcon,
                    height: height(context) / 50,
                  ),
                ),
              ),
            ),
            AppTextField(
              hintText: AppString.hintOfEmail,
              controller: emailController,
              suffixIcon: Padding(
                padding: EdgeInsets.all(height(context) / 50),
                child: Image.asset(
                  AppImages.emailIcon,
                  height: height(context) / 50,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height(context) / 40),
              child: AppDropDownButton(
                  value: selectedValue,
                  items: dropDownListItemGender
                      .map(
                        (value) => DropdownMenuItem(
                          value: value['value'],
                          child: Text(value['data']),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value.toString();
                    });
                  }),
            ),
            const Spacer(),
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
